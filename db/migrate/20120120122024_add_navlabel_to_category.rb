class AddNavlabelToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :navlabel, :string
  end

  def self.down
    remove_column :categories, :navlabel
  end
end
