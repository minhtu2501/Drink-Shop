class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.decimal :unit_price
      t.decimal :product_id
      t.integer :cart_id
      t.integer :quantity

      t.timestamps
    end
  end
end
