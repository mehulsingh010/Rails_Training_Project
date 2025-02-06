class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :phone_number, null: false, limit: 10
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end

     #adds a unique index for email to ensure uniqueness at the database level
    add_index :users, :email, unique: true
  end
end
