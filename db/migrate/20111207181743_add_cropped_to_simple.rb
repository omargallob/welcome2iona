class AddCroppedToSimple < ActiveRecord::Migration
  def self.up
    add_column :simples, :cropped, :boolean
  end

  def self.down
    remove_column :simples, :cropped
  end
end
