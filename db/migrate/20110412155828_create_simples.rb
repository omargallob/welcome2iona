class CreateSimples < ActiveRecord::Migration
  def self.up
    create_table :simples do |t|
      t.string :title
      t.text :body
      t.string :image
      t.integer :simpleable_id
      t.string :simpleable_type
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :simples
  end
end
