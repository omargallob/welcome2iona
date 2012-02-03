class AddHomeToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :home, :string
  end

  def self.down
    remove_column :pages, :home
  end
end
