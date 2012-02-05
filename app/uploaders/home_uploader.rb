# encoding: utf-8

class HomeUploader < CarrierWave::Uploader::Base
  #permissions 0777

  # Include RMagick or ImageScience support:
  include CarrierWave::RMagick
  # include CarrierWave::ImageScience
  CarrierWave.root = Rails.root.join('public')
  # Choose what kind of storage to use for this uploader:
  #storage :fog
  #storage :s3
  #930x282

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [42, 39]
  end
  version :square do
    process :resize_to_fill => [129, 122]
  end
  version :large do
    process :resize_to_fill => [930, 282]
  end
  
  def reprocess(x,y,w,h)
          manipulate! do |img|
              img.crop(x.to_i, y.to_i, w.to_i, h.to_i, true) 

              end
    resize_to_fill(930, 282)  
  end
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # def filename
  #   "something.jpg" if original_filename
  # end

end
