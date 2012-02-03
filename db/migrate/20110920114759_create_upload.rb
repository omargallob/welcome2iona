class CreateUpload < ActiveRecord::Migration
  def self.up
    create_table :uploads do |t|
      t.string :title
      t.string :image      
      t.text :description
      t.integer :album_id
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :uploads
  end
end
