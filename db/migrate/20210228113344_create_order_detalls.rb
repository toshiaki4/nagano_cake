class CreateOrderDetalls < ActiveRecord::Migration[5.0]
  def change
    create_table :order_detalls do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :amount
      t.integer :production_status
      t.integer :price

      t.timestamps
    end
  end
end
