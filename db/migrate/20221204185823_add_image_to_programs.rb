class AddImageToPrograms < ActiveRecord::Migration[7.0]
  def change
    add_column :programs, :image, :blob
  end
end
