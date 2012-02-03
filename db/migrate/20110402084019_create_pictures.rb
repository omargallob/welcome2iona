class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :gallery_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
