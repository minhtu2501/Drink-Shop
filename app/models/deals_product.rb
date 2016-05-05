class DealsProduct < ActiveRecord::Base
  belongs_to :deal, foreign_key: :deal_id
  belongs_to :product, foreign_key: :product_id
end
