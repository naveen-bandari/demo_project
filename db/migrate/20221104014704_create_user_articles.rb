# frozen_string_literal: true

class CreateUserArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_articles do |t|
      t.bigint  :user_id
      t.bigint  :article_id

      t.timestamps
    end
  end
end
