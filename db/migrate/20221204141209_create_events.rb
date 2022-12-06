class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.boolean :is_completed
      t.string :title
      t.string :start_date
      t.string :end_date
      t.string :venue
      t.string :description
      t.blob :image

      t.timestamps
    end
  end
end
