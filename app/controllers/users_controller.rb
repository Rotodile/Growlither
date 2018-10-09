class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def index
    @users = User.all 
  end

  def update
    @user = current_user    
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_back(fallback_location: root_path) 
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :picture)
    end
end
