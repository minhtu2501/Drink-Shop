class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :assign_role
  has_many :products
  belongs_to :role
  ratyrate_rater
  
  validates_presence_of :name

  def assign_role
	self.role = Role.find_by name: "Regular" if self.role.nil?
  end

  def admin?
  	self.role.name == "Admin"
  end

  def seller?
  	self.role.name == "Seller"
  end

  def regular?
	self.role.name == "Regular"
  end

  def guest?
  	self.role.name == ""
  end
end
