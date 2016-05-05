class CreateDealsProducts < ActiveRecord::Migration
  def change
    create_table :deals_products do |t|
      t.belongs_to :product, index: true, foreign_key: true
      t.belongs_to :deal, index: true, foreign_key: true
    end
  end
end
