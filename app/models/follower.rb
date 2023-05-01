class Follower < ApplicationRecord
  has_many :friend_histories, class_name: 'Record', foreign_key: 'user_id'
  belongs_to :friend, class_name: 'User', foreign_key: 'followee_id'
end
