# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  #permissions 0777
  #storage :file
  
  # Include RMagick or ImageScience support:
  include CarrierWave::RMagick

  CarrierWave.root = Rails.root.join('public')
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end



  #process :resize_to_fill => [757, 567]

  version :thumb do
    process :resize_to_fill => [40, 39]
  end
  version :square do
    process :resize_to_fill => [129, 122]
  end
  
  version :large do
    process :resize_to_fill => [757, 567]
  end 
  def reprocess(x,y,w,h)
          manipulate! do |img|
              img.crop(x.to_i, y.to_i, w.to_i, h.to_i, true) 

              end
    resize_to_fill(757, 567)  
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end


end
