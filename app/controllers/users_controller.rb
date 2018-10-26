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
      redirect_to root_path
    end
  end

  def add_friend
    @user = User.find(params[:id])
    if current_user.friend_request(@user)
      redirect_to users_path, notice: "Friend request successfully sent."
    else
      redirect_to users_path, notice: "There was an error sending the friend request"
    end
  end
  private

    def user_params
      params.require(:user).permit(:name, :picture)
    end
end
