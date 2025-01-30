class AddColumnsToTurves < ActiveRecord::Migration[7.2]
  def change
    add_column :turves, :name, :string
    add_column :turves, :location, :string
    add_column :turves, :opening_time, :datetime
    add_column :turves, :close_time, :datetime
    add_column :turves, :status, :boolean
    add_reference :turves, :user, null: false, foreign_key: true
    add_column :turves, :image, :string
  end
end
