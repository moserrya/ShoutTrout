class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_number, null: false

      t.datetime :last_outbound_message_at
      t.datetime :last_inbound_message_at

      t.integer  :hour_to_send_message

      t.timestamps
    end
  end
end
