class AddCollegeToTeam < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :college, null: false, foreign_key: true
  end
end
