class CreateMaps < ActiveRecord::Migration
  def self.up
    create_table :maps do |t|
      t.string :title
      t.integer :category_id
      t.text :description
      t.text :embed_code
      t.timestamps
    end
  end

  def self.down
    drop_table :maps
  end
end
