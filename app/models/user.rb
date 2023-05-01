require 'jwt'

class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }

  has_many :records
  has_many :followers, class_name: 'Follower', foreign_key: 'follower_id'
  has_many :followees, class_name: 'Follower', foreign_key: 'followee_id'

  SECRET_KEY = Rails.application.credentials.secret_key_base

  def encode_token
    JWT.encode({ name: }, SECRET_KEY, 'HS256')
  end

  def clock_in
    record = records.create(clock_in: Time.now)
    return unless record.present?

    record_histories
  end

  def clock_out(id)
    record = records.find(id)
    return unless record.present?

    clock_out_time = Time.now
    duration_in_hours = (clock_out_time - record.clock_in) / 3600
    record.update(clock_out: clock_out_time, complete: true, duration: duration_in_hours)
  end

  def record_histories
    records.order(:created_at)
  end
end
