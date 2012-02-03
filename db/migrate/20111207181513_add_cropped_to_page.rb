class AddCroppedToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :cropped, :boolean
  end

  def self.down
    remove_column :pages, :cropped
  end
end
