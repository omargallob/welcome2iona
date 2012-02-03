class AddCategoryIdToGallery < ActiveRecord::Migration
  def self.up
    add_column :galleries, :category_id, :integer
  end

  def self.down
    remove_column :galleries, :category_id
  end
end
