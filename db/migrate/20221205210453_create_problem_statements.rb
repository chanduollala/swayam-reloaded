class CreateProblemStatements < ActiveRecord::Migration[7.0]
  def change
    create_table :problem_statements do |t|
      t.string :title
      t.string :data
      t.belongs_to :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
