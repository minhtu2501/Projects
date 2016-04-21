class Permission < ActiveRecord::Base
	has_many :permissions_roles, foreign_key: :permission_id, dependent: :destroy
	has_many :permissions_users, foreign_key: :permission_id, dependent: :destroy
end
