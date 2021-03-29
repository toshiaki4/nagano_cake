class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :order_status
      t.integer :payment_method
      t.string :shipping_address
      t.string :postal_code
      t.string :name
      t.integer :shipping
      t.integer :total_amount

      t.timestamps
    end
  end
end
