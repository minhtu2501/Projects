class MicropostsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy

	def show
		@pictures = @micropost.pictures.all
	end

	def new
		@micropost = Micropost.new
		@picture = @micropost.pictures.build
		
	end

	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			params[:pictures]['picture'].each do |picture|
   		 		@picture = @micropost.pictures.create(picture: picture)
   		 	end
			flash[:success] = "Micropost created!"
			redirect_to root_path
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@micropost.destroy
		flash[:success] = "Micropost deleted!"
		redirect_to request.referrer || root_path
	end

	private

	def micropost_params
		params.require(:micropost).permit(:content, pictures_attributes: [:id, :micropost_id ,:picture])
	end

	def correct_user
		@micropost = current_user.microposts.find_by(id: params[:id])
		redirect_to root_path if @micropost.nil?
	end
end
