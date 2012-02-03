require 'file_size_validator' 
class Upload < ActiveRecord::Base
  attr_accessible :title, :description, :image,:crop_x,:crop_y, :crop_h, :crop_w,:album_id,:cropped
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :image, :on => :create, :message => "can't be blank"
  belongs_to :album
  mount_uploader :image, PhotoUploader
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
  #     
  def image_geometry
    img = Magick::Image::read(self.image_url).first
    @geometry = {:width => img.columns, :height => img.rows }
  end
  # 
  private


  def reprocess_image
    image.reprocess(crop_x,crop_y,crop_w,crop_h)
    image.recreate_versions!
  end
end
