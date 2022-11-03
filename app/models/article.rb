# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, :description, presence: true

  belongs_to :category

  validate :validate_title
  validate :validate_category

  after_create :perfrom_after_create

  after_save :send_an_alert, if: :title_previously_changed?
  after_save :inform_category_changes, if: :category_id_previously_changed?

  after_commit  :perfrom_after_commit
  after_destroy :perfrom_after_destroy
  before_destroy :perfrom_before_destroy
  before_validation :set_defaults, :remove_spaces

  def validate_title
    # puts "=============validate_title=========="

    return if title.to_s.length > 5

    errors.add(:title, 'should be minimum of 5 characters')    
  end

  def validate_category
    # puts "=============validate_category=========="

    return if category.present? && category.articles.count > 0

    errors.add(:category, 'should have atleast one article')
  end

  def set_defaults
    # puts '=========INN before_validation set_defaults======='
    self.description = 'Test default description' if description.blank?

    self.category = Category.first if category.blank?
  end

  def remove_spaces
    # puts '==========remove_spaces'
    return if title.blank?

    self.title = title.strip
  end

  def perfrom_before_destroy
    # comments.destroy_all
    # puts '============perfroming_before_destroy==========='
  end

  def perfrom_after_create
    # puts '==============perfroming_after_create========='
    previous_count = category.articles_count
    category.update(articles_count: previous_count + 1)
    # puts '========after incrementing count======='
  end

  def inform_category_changes
    puts "====================inform_category_changes============"
    #TODO:
    # self.user.send_category_info_email
  end

  def send_an_alert
    puts '=============send_an_alert======='
  end

  def perfrom_after_commit
    # puts '=============perfroming_after_commit======='
  end

  def perfrom_after_destroy
    # puts '===========performing perfrom_after_destroy==========='
    previous_count = category.articles_count
    category.update(articles_count: previous_count - 1)
    # puts '========after decrementing count======='
  end
end
