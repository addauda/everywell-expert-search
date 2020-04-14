class Member < ApplicationRecord
  has_many :topics
  has_many :friends, class_name: 'Friend', foreign_key: 'from_id'
end
