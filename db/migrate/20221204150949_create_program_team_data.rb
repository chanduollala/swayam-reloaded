class CreateProgramTeamData < ActiveRecord::Migration[7.0]
  def change
    create_table :program_team_data do |t|
      t.belongs_to :team, null: false, foreign_key: true
      t.belongs_to :program, null: false, foreign_key: true
      t.string :data

      t.timestamps
    end
  end
end
