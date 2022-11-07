# frozen_string_literal: true

class UserArticle < ApplicationRecord
  belongs_to :article
  belongs_to :user
end
