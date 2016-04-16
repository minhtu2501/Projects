class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :roles_users, :users, column: 'user_id'
    add_foreign_key :roles_users, :roles, column: 'role_id'
    add_foreign_key :permissions_roles, :roles, column: 'role_id'
    add_foreign_key :permissions_roles, :permissions, column: 'permission_id'
    add_foreign_key :permissions_users, :users, column: 'user_id'
    add_foreign_key :permissions_users, :permissions, column: 'permission_id'
  end
end