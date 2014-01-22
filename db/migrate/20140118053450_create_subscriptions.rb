class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :plan_id

      t.timestamps
    end
    add_index :user_id, :plan_id
  end
end
