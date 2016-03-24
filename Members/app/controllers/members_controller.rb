class MembersController < ApplicationController
  def index
  end
  def new
  	@member = Member.new
  end

  def create
  	@member = Member.new(member_params)
  	if @member.save
      flahs[:notice] = "Create Successful!"
      redirect_to members_path
    else
      render action: 'new'
    end
  end	

  def members_list
    @member = Member.all
    unless @member
      redirect_to members_path
      flash[:notice] = "Not found!"
    end
  end


  def show
  end

  private
  def member_params
  	params.require(:member).permit(:name, :age, :address, :email, :tel)
  end
end

