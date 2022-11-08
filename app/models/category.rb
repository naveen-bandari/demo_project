# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true

  validate :validate_name

  has_many :articles
  # has_many  :articles, dependent: :destroy #records will be deleted
  # has_many  :articles, dependent: :nullify #records will be updated with null
  # has_many  :articles, dependent: :restrict_with_error #raise an exception

  before_destroy :delete_associated_articles

  def validate_name
    puts '=================validate_name==========='
    return if name.to_s.length > 5

    errors.add(:name, 'should be with minimum of 5 characters')
  end

  def delete_associated_articles
    puts '==========innn delete_associated_articles ======='
    articles.destroy_all
  end
end
