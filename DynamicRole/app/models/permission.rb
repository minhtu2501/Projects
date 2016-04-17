class Permission < ActiveRecord::Base
	has_many :permission_roles, foreign_key: :permission_id
	has_many :permissions_users, foreign_key: :permission_id
end
