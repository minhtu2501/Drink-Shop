class AddDealPercentToProducts < ActiveRecord::Migration
  def change
    add_column :products, :deal_percent, :integer
  end
end
