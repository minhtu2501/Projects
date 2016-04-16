class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :roles_users
  has_many :roles, through: :roles_users
  has_many :permissions_users
  has_many :permissions, through: :permissions_users
  has_and_belongs_to_many :permissions_roles, through: :roles, class_name: Permission.name

  def super_admin?
    self.roles.each do |role|
  	  role.name == "Super Admin"
  	end
  end
  
  def set_roles(roles)
    roles.each do |id|
      role = Role.find(id)
      self.roles << role
    end
  end

  def set_permissions(permissions)
    permissions.each do |id|
      permission = Permission.find(id)
      self.permissions << permission
    end
  end
end
