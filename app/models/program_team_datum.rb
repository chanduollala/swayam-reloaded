class ProgramTeamDatum < ApplicationRecord
  belongs_to :team
  belongs_to :program
end
