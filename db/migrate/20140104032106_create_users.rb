class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_number, null: false

      t.datetime :outbound_text_at
      t.datetime :inbound_text_at

      t.integer  :hour_to_send_message

      t.timestamps
    end
  end
end
