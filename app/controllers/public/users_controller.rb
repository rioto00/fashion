class Public::UsersController < ApplicationController
  
  def mypage
    @user = current_user
    @post = current_user
    @post_new = Post.new
    @posts = current_user.posts
  end

  def edit
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts 
    @post_new = Post.new
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "プロフィールが更新されました"
      redirect_to user_users_mypage_path(@user)
    else
      flash.now[:alert] = "プロフィールの更新に失敗しました"
      render :mypage
    end
  end

   # プロフィール画像の取得を処理
  def get_profile_image
  end
  
  def get_post_image
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :gender, :introduction, :profile_image)
  end
  
end
