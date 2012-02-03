class AddCroppedToUpload < ActiveRecord::Migration
  def self.up
    add_column :uploads, :cropped, :boolean
  end

  def self.down
    remove_column :uploads, :cropped
  end
end
