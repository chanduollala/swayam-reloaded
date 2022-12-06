class Participant < ApplicationRecord
  belongs_to :user
  has_many :team_participants
  has_many :teams, through: :team_participants
end
