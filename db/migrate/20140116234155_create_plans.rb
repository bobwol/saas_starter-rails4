class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :price, default: 0
      t.string :interval, default: 'month'
      t.integer :display_order, default: 0
      t.text :features
      t.boolean :is_featured, default: false
      t.boolean :has_trial, default: false

      t.timestamps
    end
  end
end
