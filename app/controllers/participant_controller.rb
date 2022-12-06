class ParticipantController < ApplicationController

  def create
    params.permit!
    @participant=Participant.new(params["participant"])
    @participant.save
  end
end
