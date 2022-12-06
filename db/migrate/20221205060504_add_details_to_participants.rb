class AddDetailsToParticipants < ActiveRecord::Migration[7.0]
  def change
    add_column :participants, :course, :string
    add_column :participants, :stream, :string
    add_column :participants, :year_of_passing, :string
  end
end
