class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name,         null: false
      t.string :phone_number, null: false
      t.integer :user_id,     null: false

      t.datetime :texted_at

      t.timestamps
    end
  end
end
