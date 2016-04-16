class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :permissions

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
