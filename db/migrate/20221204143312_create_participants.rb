class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.string :player_name
      t.belongs_to :user, null: false, foreign_key: true
      t.string :bio
      t.blob :image

      t.timestamps
    end
  end
end
