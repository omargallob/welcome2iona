require 'file_size_validator' 

class Picture < ActiveRecord::Base
  attr_accessible :title,:description, :image, :position,:gallery_id,:crop_x,:crop_y, :crop_h, :crop_w,:cropped
  belongs_to :gallery
  mount_uploader :image, PictureUploader
  attr_accessor  :crop_x, :crop_y, :crop_h, :crop_w
  after_update :reprocess_image, :if => :cropping?
  
  scope :cropped,lambda{
    where("cropped = ?",true)
  }
  
  validates :image, 
      :file_size => { 
        :maximum => 1.megabytes.to_i 
      }

  def cropping?
    !crop_x.blank? && !crop_y.blank?  && !crop_w.blank? && !crop_h.blank?
  end
    
  def image_geometry
    img = Magick::Image::read(self.image_url).first
    @geometry = {:width => img.columns, :height => img.rows }
  end

  private


  def reprocess_image
    image.reprocess(crop_x,crop_y,crop_w,crop_h)
    image.recreate_versions!
  end
end
