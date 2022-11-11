# frozen_string_literal: true

class User < ApplicationRecord
  validates :uid, :name, presence: true

  validates :name, uniqueness: true

  has_many  :user_articles

  has_many :articles, through: :user_articles

  before_validation :populate_unique_uid

  after_create  :send_welcome_email
  after_update  :notify_profile_update, if: :name_previously_changed?

  def send_welcome_email
    puts "========send_welcome_email::::::#{self}======"
    mail = UserMailer.send_welcome_email(id)
    mail.deliver_now
  end

  def notify_profile_update
    puts "==========INNNN   notify_profile_update:::========"
    mail = UserMailer.notify_profile_update(id)
    mail.deliver_now
  end

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
