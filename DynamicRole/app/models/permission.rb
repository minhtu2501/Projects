class Permission < ActiveRecord::Base
	has_many :permissions_users, foreign_key: :permission_id
  has_many :permissions_roles, foreign_key: :permission_id
end
