class CreatePost < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.text :body
      t.integer :category_id
      t.integer :position
      t.datetime :published_on
      t.boolean :published
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
