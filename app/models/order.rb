class Order < ActiveRecord::Base
 belongs_to :cart
 has_many :order_items, through: :cart

 validates :custome_name, presence: true, length: {maximum: 50}
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true, length: {maximum: 255}, 
				format: {with: VALID_EMAIL_REGEX}
 validates :mobile, presence: true, length: {in: 9..10}
 validates :address, presence: true
 before_save :downcase_email
 before_save :set_status

 def downcase_email
	self.email = email.downcase
 end

 private
 def set_status
  self.status = 'Waiting Process..'
 end
end
