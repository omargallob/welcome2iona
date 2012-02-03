class Gallery < ActiveRecord::Base
  attr_accessible :title, :category_id
  
  belongs_to :category
  has_many :pictures, :dependent => :destroy
   attr_accessible :pictures_attributes 
   attr_writer :pictures_attributes
   accepts_nested_attributes_for :pictures, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
   #translates :title
end
