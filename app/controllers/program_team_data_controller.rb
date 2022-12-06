class ProgramTeamDataController < ApplicationController
  before_action :set_program_team_datum, only: %i[ show update destroy ]

  # GET /program_team_data
  def index
    @program_team_data = ProgramTeamDatum.all

    render json: @program_team_data
  end

  # GET /program_team_data/1
  def show
    render json: @program_team_datum
  end

  # POST /program_team_data
  def create
    @program_team_datum = ProgramTeamDatum.new(program_team_datum_params)

    if @program_team_datum.save
      render json: @program_team_datum, status: :created, location: @program_team_datum
    else
      render json: @program_team_datum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /program_team_data/1
  def update
    if @program_team_datum.update(program_team_datum_params)
      render json: @program_team_datum
    else
      render json: @program_team_datum.errors, status: :unprocessable_entity
    end
  end

  # DELETE /program_team_data/1
  def destroy
    @program_team_datum.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program_team_datum
      @program_team_datum = ProgramTeamDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def program_team_datum_params
      params.require(:program_team_datum).permit(:team_id, :program_id, :data)
    end
end
