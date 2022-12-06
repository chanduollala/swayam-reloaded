class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.belongs_to :program, null: false, foreign_key: true
      t.string :marks
      t.string :remarks

      t.timestamps
    end
  end
end
