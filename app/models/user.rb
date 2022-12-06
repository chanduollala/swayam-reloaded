class User < ApplicationRecord
  has_secure_password
  has_one :user_detail
  has_many :participants
  has_many  :teams, through: :participants
  has_many :programs, through: :teams
end
