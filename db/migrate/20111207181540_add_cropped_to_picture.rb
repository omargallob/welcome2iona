class AddCroppedToPicture < ActiveRecord::Migration
  def self.up
    add_column :pictures, :cropped, :boolean
  end

  def self.down
    remove_column :pictures, :cropped
  end
end
