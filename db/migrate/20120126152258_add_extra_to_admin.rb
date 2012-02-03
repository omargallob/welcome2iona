class AddExtraToAdmin < ActiveRecord::Migration
  def self.up
    add_column :admins, :name, :string
    add_column :admins, :surname, :string
  end

  def self.down
    remove_column :admins, :surname
    remove_column :admins, :name
  end
end
