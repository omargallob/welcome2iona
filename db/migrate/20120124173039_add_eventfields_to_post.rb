class AddEventfieldsToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :start_at, :datetime
    add_column :posts, :end_at, :datetime
  end

  def self.down
    remove_column :posts, :end_at
    remove_column :posts, :start_at
  end
end
