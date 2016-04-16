class UsersController < ApplicationController
	before_filter :authenticate_user!
  #before_filter :load_permissions
  load_and_authorize_resource
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@roles = @user.roles
		@permissions = @user.permissions
	end

	def edit
		@user = User.find(params[:id])
		@roles = Role.all
		@user_roles = @user.roles.collect{|r| r.id}
	end

	def edit_permissions
		@user = User.find(params[:id])
		@permissions = Permission.all
		@user_permissions = @user.permissions.collect{|p| p.id}
	end

	def update
		@user = User.find(params[:id])
		@user.roles = []
		@user.set_roles(params[:roles]) if params[:roles]
		if @user.save
      	redirect_to users_path
	  end
	end

	def update_permissions
		@user = User.find(params[:id])
		@user.permissions = []
		@user.set_permissions(params[:permissions]) if params[:permissions]
		if @user.save
      	redirect_to users_path
	  end
	end
end
