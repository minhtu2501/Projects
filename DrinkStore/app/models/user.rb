class User < ActiveRecord::Base
  before_save :assign_role
  has_many :products
  belongs_to :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
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
