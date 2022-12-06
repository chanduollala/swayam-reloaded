class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show update destroy ]

  # GET /teams
  def index
    @teams = Team.all

    render json: @teams
  end

  # GET /teams/1
  def show
    render json: @team
  end

  def create_user(participant)
    if User.find_by_username(participant[:email])
      @user=User.find_by_username(participant[:email])
      @user_detail = UserDetail.find_by(user: @user)
      @user_detail.update(
        firstname: participant[:first_name],
        lastname: participant[:last_name],
        phone1: participant[:phone],
        email: participant[:email],
      )
    else
      @user = User.new(username: participant[:email],
                       password: @team.name + participant[:phone],
                       usertype: 'P')
      @user.save
      @user_detail = UserDetail.new(firstname: participant[:first_name],
                                    lastname: participant[:last_name],
                                    phone1: participant[:phone],
                                    email: participant[:email],
                                    user: @user
      )
      @user_detail.save
    end

  end


  def create_participant(participant)
    @participant = Participant.new(player_name: participant[:first_name]+participant[:year_of_passing],
      year_of_passing: participant[:year_of_passing],
      course: participant[:course],
      stream: participant[:stream],
      bio: "Hey! I'm participating in Swayam event",
                                   user:@user)
    @participant.save
  end

  # POST /teams
  def create

    @team = Team.new(team_params )
    # @team.problem_statement_id = 1
    @team.save

    params[:participants].each { |participant|
      print(participant)

      create_user(participant)
      create_participant(participant)

      @tp = TeamParticipant.new(team: @team,
                                participant: @participant)
      @tp.save
    }


      render json: @team, status: :created, location: @team

  end

  # PATCH/PUT /teams/1
  def update
    if @team.update(team_params)
      render json: @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teams/1
  def destroy
    @team.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:program_id,:college_id, :marks,:name, :remarks, :participants)
    end
end
