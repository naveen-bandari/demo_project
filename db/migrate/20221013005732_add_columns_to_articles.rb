class AddColumnsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :active, :boolean, default: true
  end
end
