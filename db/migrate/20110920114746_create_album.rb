class CreateAlbum < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.string :albumable_type
      t.integer :albumable_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
