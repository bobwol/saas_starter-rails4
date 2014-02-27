class AddCardInfoToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :last_4, :string
    add_column :subscriptions, :card_type, :string
    add_column :subscriptions, :amount, :integer
    add_column :subscriptions, :coupon_id, :integer
    
    add_index :subscriptions, :coupon_id
  end
end
