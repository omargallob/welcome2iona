# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  #permissions 0777
  #storage :file
  #storage :fog
  
  # Include RMagick or ImageScience support:
  include CarrierWave::MiniMagick
  CarrierWave.root = Rails.root.join('public')
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  #process  :resize_to_fill => [610, 232]

  version :thumb do
     process :resize_to_fill => [100, 100]
   end
   
   version :large do
      process :resize_to_fill => [610, 232]
    end

   def reprocess(x,y,w,h)
           manipulate! do |img|
               img.crop(x.to_i, y.to_i, w.to_i, h.to_i, true) 

               end
     resize_to_fill(610, 232)  
   end
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # def filename
  #   "something.jpg" if original_filename
  # end

end
