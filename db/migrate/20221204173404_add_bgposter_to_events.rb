class AddBgposterToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :bgposter, :blob
  end
end
