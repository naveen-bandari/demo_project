# frozen_string_literal: true

namespace :users do
  task populate_uid: :environment do
    User.all.each do |user|
      token = nil

      loop do
        token = SecureRandom.hex(10)

        break if User.find_by(uid: token).blank?
      end
      user.update(uid: token)
    end
  end
end
