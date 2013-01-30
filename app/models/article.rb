class Article < ActiveRecord::Base
  attr_accessible :title, :content

  default_scope order: 'created_at DESC'

end
