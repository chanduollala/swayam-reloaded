class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.belongs_to :event, null: false, foreign_key: true
      t.boolean :is_open
      t.string :title
      t.string :description
      t.string :datetime
      t.integer :team_size

      t.timestamps
    end
  end
end
