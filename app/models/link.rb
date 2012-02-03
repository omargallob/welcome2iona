class Link < ActiveRecord::Base
  attr_accessible :title, :category_id, :page_id
  belongs_to :page
  belongs_to :category
end
