class UsersController < ApplicationController

  def index
    @users = User.all.page(params[:page]).per(3)
  end

  def new
  end

  def search
    @users = User.tagged_with(params[:keyword]).page(params[:page]).per(3)
    @keyword = params[:keyword]
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.permit(:nickname, :introduce, :twitter_account, :image)
    params.require(:user).permit(:tag_list)
  end

end


