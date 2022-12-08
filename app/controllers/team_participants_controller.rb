require 'csv'
class TeamParticipantsController < ApplicationController
  before_action :set_team_participant, only: %i[ show update destroy ]

  # GET /team_participants
  def index
    @team_participants = TeamParticipant.all

    render json: @team_participants
  end

  # GET /team_participants/1
  def show
    render json: @team_participant
  end

  # POST /team_participants
  def create
    @team_participant = TeamParticipant.new(team_participant_params)

    if @team_participant.save
      render json: @team_participant, status: :created, location: @team_participant
    else
      render json: @team_participant.errors, status: :unprocessable_entity
    end
  end


  def export
    @team_participants = TeamParticipant.all
    csv =  CSV.generate do |csv|
      csv << ["id", "team_id","participant_id"]
      @team_participants.each do |entry|
        csv << [entry.id, entry.team_id, entry.participant_id]
      end
    end
    print(csv)
    # render @team_participants.to_csv, filename: "posts-#{DateTime.now.strftime("%d%m%Y%H%M")}.csv"
  end

  # PATCH/PUT /team_participants/1
  def update
    if @team_participant.update(team_participant_params)
      render json: @team_participant
    else
      render json: @team_participant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /team_participants/1
  def destroy
    @team_participant.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_participant
      @team_participant = TeamParticipant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_participant_params
      params.require(:team_participant).permit(:team_id, :participant_id, :is_lead)
    end
end
