class CreateTimeSlots < ActiveRecord::Migration[7.2]
  def change
    create_table :time_slots do |t|
      t.references :turf, null: false ,foreign_key: true
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :status, null: false, default: 0


      t.timestamps
    end

    # add_index :time_slots, :turf_slot_id, unique: true
  end
end
