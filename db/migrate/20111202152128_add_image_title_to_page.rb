class AddImageTitleToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :image_title, :string
  end

  def self.down
    remove_column :pages, :image_title
  end
end
