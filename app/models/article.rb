class Article < ActiveRecord::Base
  include TimestampHelper
  attr_accessible :content

  validates_presence_of :content

  default_scope order: 'created_at DESC'
end
