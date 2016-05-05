class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :user_id
      t.integer :category_id
      t.string  :name
      t.string  :description
      t.decimal :price
      t.integer :number

      t.timestamps null: false
    end
  end
end
