class Maps < ActiveRecord::Base
  attr_accessible :title, :category_id, :description, :embed_code
  belongs_to :category
end
