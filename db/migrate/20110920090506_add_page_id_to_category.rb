class AddPageIdToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :page_id, :integer
  end

  def self.down
    remove_column :categories, :page_id
  end
end
