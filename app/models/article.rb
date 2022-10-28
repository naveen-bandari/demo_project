# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :description, presence: :true

  belongs_to :category
end
