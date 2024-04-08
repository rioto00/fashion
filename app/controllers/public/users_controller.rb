class Public::UsersController < ApplicationController
  
  def mypage
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def show
  end

  def update
    @user = current_user
    @user.save
    if @user.update(user_params)
      redirect_to user_users_mypage_path(@user),notice: "プロフィールが更新されました"
    else
      flash.now[:alert] = "プロフィールの更新に失敗しました。"
      render :mypage
    end
  end

   # プロフィール画像の取得を処理
  def get_profile_image
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :gender, :introduction, :profile_image)
  end
  
end
