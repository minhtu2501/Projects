class Permission < ActiveRecord::Base
	has_many :permission_roles
  has_many :role, through: :permission_roles
	has_many :permissions_users
  has_many :user, through: :permissions_users
end
