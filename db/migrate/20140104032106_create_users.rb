class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,         null: false
      t.string :phone_number, null: false

      t.datetime :text_sent_at
      t.datetime :text_received_at

      t.string :time_zone

      t.timestamps
    end
  end
end
