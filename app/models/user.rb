class User < ApplicationRecord
  has_one :journal
  validates :first_name, presence: true
end
