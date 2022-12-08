class Program < ApplicationRecord
  belongs_to :event
  has_many :teams
end
