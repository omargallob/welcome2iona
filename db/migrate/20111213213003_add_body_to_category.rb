class AddBodyToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :body, :text
  end

  def self.down
    remove_column :categories, :body
  end
end
