class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to user_path
    else
      render :edit
    end
  end

  def likes
    @user = User.find_by(id: params[:id])
  end

  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :image_name, :password)
    end

  # protected

  #   def update_resource(resource, params)
  #     resource.update_without_password(params)
  #   end

  # 効いていないのでコメントアウトしてる
  # def after_update_path_for(resource)
  #   user_path
  # end
end
