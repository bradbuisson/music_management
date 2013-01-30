class Article < ActiveRecord::Base
  attr_accessible :content

  validates_presence_of :content

  default_scope order: 'created_at DESC'
end
