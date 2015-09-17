class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Sample App, #{@user.name}!!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.following_users
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.follower_users
  end



  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
      flash[:success] = 'プロフィールを更新しました。'
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :phrase, :website)
  end
end
