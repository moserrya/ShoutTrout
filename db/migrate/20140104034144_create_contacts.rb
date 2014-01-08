class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name,         null: false
      t.string :phone_number, null: false
      t.string :email
      t.integer :user_id,     null: false

      t.datetime :text_sent_at
      t.datetime :text_received_at

      t.timestamps
    end
  end
end
