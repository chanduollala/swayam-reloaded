class ProgramsController < ApplicationController
  before_action :set_program, only: %i[ update destroy ]

  # GET /programs
  def index
    @programs = Program.all

    render json: @programs
  end

  # GET /programs/1
  def show
    @programs = Program.where(:event_id => params[:id])
    render json: @programs
  end

  def teamsize
    @program = Program.find_by(params[:id])
      render json: @program.team_size
  end

  # POST /programs
  def create
    @program = Program.new(program_params)

    if @program.save
      render json: @program, status: :created, location: @program
    else
      render json: @program.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /programs/1
  def update
    if @program.update(program_params)
      render json: @program
    else
      render json: @program.errors, status: :unprocessable_entity
    end
  end

  # DELETE /programs/1
  def destroy
    @program.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def program_params
      params.require(:program).permit(:event_id, :is_open, :title, :description, :datetime, :team_size)
    end
end
