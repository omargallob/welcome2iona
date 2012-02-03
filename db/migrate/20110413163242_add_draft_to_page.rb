class AddDraftToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :draft, :boolean,:default => 1
  end

  def self.down
    remove_column :pages, :draft
  end
end
