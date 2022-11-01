# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :category

  after_create :perfrom_after_create
  after_save :perfrom_after_save
  after_commit  :perfrom_after_commit
  after_destroy :perfrom_after_destroy
  before_destroy :perfrom_before_destroy
  before_validation :set_defaults, :remove_spaces

  def set_defaults
    puts '=========INN before_validation set_defaults======='
    self.description = 'Test default description' if description.blank?

    self.category = Category.first if category.blank?
  end

  def remove_spaces
    puts '==========remove_spaces'
    return if title.blank?

    self.title = title.strip
  end

  def perfrom_before_destroy
    # comments.destroy_all
    puts '============perfroming_before_destroy==========='
  end

  def perfrom_after_create
    puts '==============perfroming_after_create========='
    previous_count = category.article_count
    category.update(article_count: previous_count + 1)
    puts '========after incrementing count======='
  end

  def perfrom_after_save
    puts '=============perfroming_after_save======='
  end

  def perfrom_after_commit
    puts '=============perfroming_after_commit======='
  end

  def perfrom_after_destroy
    puts '===========performing perfrom_after_destroy==========='
    previous_count = category.article_count
    category.update(article_count: previous_count - 1)
    puts '========after decrementing count======='
  end
end
