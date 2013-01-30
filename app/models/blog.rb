class Blog < ActiveRecord::Base
  attr_accessible :title, :content, :published, :tag_names

  attr_writer :tag_names
  after_save :assign_tags

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates_presence_of :title, :content

  scope :published, lambda { {conditions: ['published = ?', true]} }
  scope :unpublished, lambda { {conditions: ['published = ?', false]} }
  
  default_scope order: 'created_at DESC'
  
  def tag_names
    @tag_names || tags.map(&:name).join(', ')
  end
  
private
  
  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\,/).map do |name|
        Tag.find_or_create_by_name(name.gsub(/\s+/, '').downcase)
      end
    end
  end
end
