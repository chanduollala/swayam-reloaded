class ProblemStatementsController < ApplicationController
  before_action :set_problem_statement, only: %i[ show update destroy ]

  # GET /problem_statements
  def index
    @problem_statements = ProblemStatement.all

    render json: @problem_statements
  end

  # GET /problem_statements/1
  def show
    render json: @problem_statement
  end

  # POST /problem_statements
  def create
    @problem_statement = ProblemStatement.new(problem_statement_params)

    if @problem_statement.save
      render json: @problem_statement, status: :created, location: @problem_statement
    else
      render json: @problem_statement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /problem_statements/1
  def update
    if @problem_statement.update(problem_statement_params)
      render json: @problem_statement
    else
      render json: @problem_statement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /problem_statements/1
  def destroy
    @problem_statement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_problem_statement
      @problem_statement = ProblemStatement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def problem_statement_params
      params.require(:problem_statement).permit(:title, :data, :team_id)
    end
end
