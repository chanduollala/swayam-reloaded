class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    if @user
      render json: @user,only: :username, include: {participants:{include: {},only:[:player_name, :course, :stream, :year_of_passing]},teams:{include: [ program: {only: :title}, participants:{only: :user, include: {user: {only: :username}}}], only:[:name, :id, :data] }, user_detail:{only: [:id,:firstname, :lastname, :phone1, :email, :image]}},
             status: :ok
    else
      render json:  "Incorrect Password", status: :unprocessable_entity
    end
  end

  def login_auth
    @user = User.find_by(username: params[:username]).authenticate(params[:password])
    #print(@user.authenticate(params[:password]))
    if @user
      render json: @user, status: :ok
    else
      render json:  "Incorrect Password", status: :unprocessable_entity
    end
  end



  def login_phone_auth
    @user = User.find_by(user_detail: UserDetail.find_by(phone1: params[:phone]))

    if @user
      render json: @user, status: :ok
    else
      render json:  "USer not found", status: :unprocessable_entity
    end
  end

  def admin_login
    @user = User.find_by(username: params[:username], usertype: 'A').authenticate(params[:password])

    if @user
      render json: Admin.find_by(user:@user).passcode, status: :ok
    else
      render json:  "USer not found", status: :unprocessable_entity
    end
  end


  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password_digest, :usertype)
    end
end
