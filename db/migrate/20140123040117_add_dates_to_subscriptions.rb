class AddDatesToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :start_date, :date, default: Date.today
    add_column :subscriptions, :end_date, :date, default: Date.today + 1.month
    
    add_index :subscriptions, :start_date
    add_index :subscriptions, :end_date
  end
end
