class CreateTeamParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :team_participants do |t|
      t.belongs_to :team, null: false, foreign_key: true
      t.belongs_to :participant, null: false, foreign_key: true
      t.boolean :is_lead

      t.timestamps
    end
  end
end
