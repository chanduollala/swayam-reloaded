class CreateUserDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :user_details do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :firstname
      t.string :lastname
      t.string :dob
      t.string :gender
      t.string :phone1
      t.string :phone2
      t.string :email
      t.blob :image

      t.timestamps
    end
  end
end
