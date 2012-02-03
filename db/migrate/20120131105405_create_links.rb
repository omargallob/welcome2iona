class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.integer :page_id
      t.integer :category_id
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
