class Friend < ApplicationRecord
  belongs_to :from, class_name: 'Member', foreign_key: 'from_id'
  belongs_to :to, class_name: 'Member', foreign_key: 'to_id'
end
