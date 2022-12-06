class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :passcode

      t.timestamps
    end
  end
end
