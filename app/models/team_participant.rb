class TeamParticipant < ApplicationRecord
  belongs_to :team
  belongs_to :participant
end
