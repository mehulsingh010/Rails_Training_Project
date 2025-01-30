class CreateTurves < ActiveRecord::Migration[7.2]
  def change
    create_table :turves do |t|
      t.string :name, null: false
      t.string :location, null: false
      t.datetime :opening_time, null: false
      t.datetime :close_time, null: false
      t.boolean :status, null: false
      t.references :user, null: false, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
