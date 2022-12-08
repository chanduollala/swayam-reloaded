class AddDataToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :data, :blob
  end
end
