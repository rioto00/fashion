class Public::HomesController < ApplicationController
  
  def top
    @genre_id = params[:genre_id]
    @genres = Genre.all
    @posts = Post.all
    
    if @genre_id.present?
      @genre = Genre.find_by(id: @genre_id)
      @users = User.joins(:posts).where(posts: { genre_id: @genre_id }).distinct
    else
      @users = User.all
    end
  end

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー" 
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def search
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @posts = @genre.posts 
    else
      @posts = Post.all 
    end
  end

end






