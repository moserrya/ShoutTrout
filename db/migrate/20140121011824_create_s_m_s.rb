class CreateSMS < ActiveRecord::Migration
  def change
    create_table :s_m_s do |t|
      t.string :from
      t.string :to
      t.string :text
      t.string :message_uuid
      t.integer :user_id
      t.timestamps
    end
  end
end
