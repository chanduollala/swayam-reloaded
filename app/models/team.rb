class Team < ApplicationRecord
  belongs_to :program

  has_many :team_participants

  has_many  :participants, through: :team_participants

  has_one :problem_statement
end
