require 'file_size_validator' 
class Simple < ActiveRecord::Base
  attr_accessible :title,:body,:body_html, :image,:image_title, :position,:simpleable_id,:simpleable_type, :page_id, :crop_x, :crop_y, :crop_h, :crop_w,:cropped
  belongs_to :simpleable, :polymorphic => true
  belongs_to :page
  mount_uploader :image, ImageUploader
  attr_accessor  :crop_x, :crop_y, :crop_h, :crop_w
   after_update :reprocess_image, :if => :cropping?
   
   scope :cropped,lambda{
     where("cropped = ?",true)
   }
   
   def cropping?
     !crop_x.blank? && !crop_y.blank?  && !crop_w.blank? && !crop_h.blank?
   end
   #     
   def image_geometry
     img = Magick::Image::read(self.image_url).first
     @geometry = {:width => img.columns, :height => img.rows }
   end
   # 
   validates :image, 
       :file_size => { 
         :maximum => 1.megabytes.to_i 
       }
   private


   def reprocess_image
     image.reprocess(crop_x,crop_y,crop_w,crop_h)
     image.recreate_versions!
   end
  
end
