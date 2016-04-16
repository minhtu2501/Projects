class Role < ActiveRecord::Base
   has_many :roles_users
   has_many :user, through: :roles_users
   has_many :permissions_roles
   has_many :permissions, through: :permissions_roles

   validates :name, presence: true, uniqueness: true

  def set_permissions(permissions)
    permissions.each do |id|
      permission = Permission.find(id)
      self.permissions << permission
      case permission.subject_class
      when "Part"
        case permission.action
        when "create"
          self.permissions << Permission.where(subject_class: "Drawing", action: "create")
        when "update"
          self.permissions << Permission.where(subject_class: "Drawing", action: ["update", "destroy"])
        end
      end
    end
  end
end