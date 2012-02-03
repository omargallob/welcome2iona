class AddExtrafieldsToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :open, :text
    add_column :posts, :rates, :text
    add_column :posts, :address, :string
    add_column :posts, :website, :string
    add_column :posts, :phone, :string
    add_column :posts, :email, :string
  end

  def self.down
    remove_column :posts, :email
    remove_column :posts, :phone
    remove_column :posts, :website
    remove_column :posts, :address
    remove_column :posts, :rates
    remove_column :posts, :open
  end
end
