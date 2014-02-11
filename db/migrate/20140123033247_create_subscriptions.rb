class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :price,  default: 600
      t.string  :stripe_customer_token
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
