# frozen_string_literal: true

class AlterArtilcesColumns < ActiveRecord::Migration[6.1]
  def change
    change_column :articles, :active, :boolean, default: false
    add_column :articles, :approved, :boolean, default: false
  end
end
