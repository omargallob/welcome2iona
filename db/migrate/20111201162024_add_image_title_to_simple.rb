class AddImageTitleToSimple < ActiveRecord::Migration
  def self.up
    add_column :simples, :image_title, :string
  end

  def self.down
    remove_column :simples, :image_title
  end
end
