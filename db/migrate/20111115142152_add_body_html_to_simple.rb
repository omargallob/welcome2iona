class AddBodyHtmlToSimple < ActiveRecord::Migration
  def self.up
    add_column :simples, :body_html, :text
  end

  def self.down
    remove_column :simples, :body_html
  end
end
