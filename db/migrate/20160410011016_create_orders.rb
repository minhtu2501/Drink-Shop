class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :cart_id
      t.string :custome_name
      t.string :email
      t.integer :mobile
      t.string :address
      t.string :status

      t.timestamps null: false
    end
  end
end
