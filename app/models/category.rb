# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true

  has_many  :articles
  # has_many  :articles, dependent: :destroy #records will be deleted
  # has_many  :articles, dependent: :nullify #records will be updated with null
  # has_many  :articles, dependent: :restrict_with_error #raise an exception

  before_destroy :delete_associated_articles

  def delete_associated_articles
    puts '==========innn delete_associated_articles ======='
    articles.destroy_all
  end
end
