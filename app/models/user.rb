require 'jwt'

class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  SECRET_KEY = Rails.application.credentials.secret_key_base

  def encode_token
    JWT.encode({ name: }, SECRET_KEY, 'HS256')
  end
end
