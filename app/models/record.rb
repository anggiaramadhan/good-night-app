class Record < ApplicationRecord
  belongs_to :user

  validates :clock_in, presence: true
  validates :clock_out, comparison: { greater_than_or_equal_to: :clock_in }, allow_blank: true
  validates :complete, acceptance: true, unless: proc { |x| x.clock_out.blank? }
end
