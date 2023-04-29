require 'jwt'

class ApplicationController < ActionController::API
  before_action :authenticate_user

  SECRET_KEY = Rails.application.credentials.secret_key_base

  private

  def authenticate_user
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    @current_user = User.find_by(name: decode_token(header)[:name])
  end

  def decode_token(token)
    decoded = JWT.decode(token, SECRET_KEY, { algorithm: 'HS256' })
    decoded.hash_with_indifferent_access
  end
end
