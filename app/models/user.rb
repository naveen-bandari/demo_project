# frozen_string_literal: true

class User < ApplicationRecord
  validates :uid, :name, presence: true

  validates :name, uniqueness: true

  has_many  :user_articles

  has_many :articles, through: :user_articles

  before_validation :populate_unique_uid

  def populate_unique_uid
    return if uid

    token = nil

    loop do
      token = SecureRandom.hex(10)

      break if User.find_by(uid: token).blank?
    end
    self.uid = token
  end
end
