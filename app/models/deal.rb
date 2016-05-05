class Deal < ActiveRecord::Base
  has_many :deals_products, foreign_key: :deal_id
  has_many :products, through: :deals_products, dependent: :destroy
end
