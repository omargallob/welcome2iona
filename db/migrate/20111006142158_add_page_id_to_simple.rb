class AddPageIdToSimple < ActiveRecord::Migration
  def self.up
    add_column :simples, :page_id, :integer
  end

  def self.down
    remove_column :simples, :page_id
  end
end
