class RenameColumnInCategories < ActiveRecord::Migration[6.1]
  def up
    puts "===========IN UP============"
    rename_column :categories, :article_count, :articles_count
  end

  def down
    puts "===========IN DOWN============"
    rename_column :categories, :articles_count, :article_count
  end
end
