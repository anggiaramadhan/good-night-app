require 'jwt'

class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  has_many :records

  SECRET_KEY = Rails.application.credentials.secret_key_base

  def encode_token
    JWT.encode({ name: }, SECRET_KEY, 'HS256')
  end

  def clock_in
    records.create(clock_in: Time.now)
  end

  def clock_out
    record = records.find_by(complete: false)
    return unless record.present?

    clock_out_time = Time.now
    duration_in_hours = (record.clock_in - clock_out_time) / 3600
    record.update(clock_out: clock_out_time, complete: true, duration: duration_in_hours)
  end
end
