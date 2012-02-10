require 'file_size_validator'  
class Page < ActiveRecord::Base
  attr_accessible :name, :title, :navlabel, :position, :parent_id, :body,:body_html, :image_title,:image, :home, :crop_x, :crop_y, :crop_h, :crop_w,:cropped
  has_many :subpages, :class_name => 'Page', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Page', :foreign_key => 'parent_id'
  has_many :categories
  has_one :simple
  has_one :link

   attr_accessible :link_attributes 
   attr_writer :link_attributes
   accepts_nested_attributes_for :link, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
   
  #validates_presence_of :name, :navlabel, :title, :position
  validates_uniqueness_of :title
  
  has_one :metatag, :as => :metatagable,  :dependent => :destroy
  attr_accessible :metatag_attributes 
  attr_writer :metatag_attributes
  accepts_nested_attributes_for :metatag
  
  has_many :simples, :as => :simpleable,  :dependent => :destroy
  attr_accessible :simples_attributes 
  attr_writer :simples_attributes
  accepts_nested_attributes_for :simples, :reject_if => lambda { |a| a[:title].blank? }, :allow_destroy => true
  mount_uploader :image, ImageUploader
  mount_uploader :home, HomeUploader  
  
  attr_accessor  :crop_x, :crop_y, :crop_h, :crop_w
   after_update :reprocess_image, :if => :cropping?

   def cropping?
     !crop_x.blank? && !crop_y.blank?  && !crop_w.blank? && !crop_h.blank?
   end
   #     
   def home_geometry
     img = MiniMagick::Image.open("public"+self.home_url)
     @geometry = {:width => img[:width], :height => img[:height] }
   end
   # 
   private


   def reprocess_image
       image = MiniMagick::Image.from_file("public"+self.home.url)
       crop_params = "#{crop_w}x#{crop_h}+#{crop_x}+#{crop_y}"
       image.crop(crop_params)
       image
   end
   
  scope :cropped,lambda{
    where("pages.cropped = ?",true)
  }
  
  scope :main,lambda{
    where("pages.parent_id IS ?", nil).order("position")
  }
  scope :children,lambda{|id|
    where("pages.parent_id IS ?", id).order("position")
  }
  validates :home, 
      :file_size => { 
        :maximum => 2.megabytes.to_i 
      }
  # def self.find_main
  #     Page.order("position").where("parent_id IS ?", nil)
  #   end
  #   def self.find_sub(pid)
  #     Page.order("position").where('parent_id = ?', pid).all
  #   end
end
