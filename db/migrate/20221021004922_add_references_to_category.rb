# frozen_string_literal: true

class AddReferencesToCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :category, foreign_key: true
  end
end
