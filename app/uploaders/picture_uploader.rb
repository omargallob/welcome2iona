# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  #permissions 0777
  #storage :fog
  
  include CarrierWave::RMagick


  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
     process :resize_to_fill => [73, 33]
   end

  version :large_thumb do
    process :resize_to_fill => [126, 68]
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
