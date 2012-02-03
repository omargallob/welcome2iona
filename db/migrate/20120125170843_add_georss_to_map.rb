class AddGeorssToMap < ActiveRecord::Migration
  def self.up
    add_column :maps, :georss, :string
  end

  def self.down
    remove_column :maps, :georss
  end
end
