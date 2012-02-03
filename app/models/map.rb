class Map < ActiveRecord::Base
  attr_accessible :title, :category_id, :description, :embed_code, :georss
  belongs_to :category
  
  mount_uploader :georss, XmlUploader
end
