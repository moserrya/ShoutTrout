class CreateInboundMessages < ActiveRecord::Migration
  def change
    create_table :inbound_messages do |t|
      t.string :from
      t.string :to
      t.string :text
      t.string :message_uuid
      t.integer :user_id
      t.timestamps
    end

    add_index :inbound_messages, :user_id
  end
end
