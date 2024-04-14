Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  #ユーザー側
 scope module: :public do
    root to: "homes#top"
    get '/about' => "homes#about", as: 'about'
    get 'user/users/mypage', to: 'users#mypage'
    resources :users, only: [:show, :edit, :update] 
    post 'user/users/mypage', to: 'users#mypage'
    resources :posts, only: [:edit, :update, :new, :create, :show] do
      resource :favorites, only: [:create, :destroy]
      resource :comments, only: [:create, :destroy]
    end
    resources :comments, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy]
      get '/relationships/followings', to: 'relationships#followings'
      get '/relationships/followers', to: 'relationships#followers'
    get "/search" => "items#search"
  end


  # 管理者側
  namespace :admin do
    resources :genres, except: [:show]
    resources :users, only: [:index, :show, :destroy]
    get "/search" => "items#search"
  end

  get '/admin', to: redirect('/admin/sign_in')
  
end
