Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  #管理者側
  namespace :admin do
    #get '/admin', to: 'admin#users#index'
    resources :genres, except: [:show]
    resources :users, only: [:index, :show, :destroy]
  end

  #ユーザー側
  scope module: :public do
    root to: "homes#top"
    get '/about', to: 'users#index'
    get 'user/users/mypage', to: 'users#mypage'
    resources :users, only: [:show, :edit, :update]
    resources :posts, except: [:edit, :update]
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy]
    get '/relationships/followings', to: 'relationships#followings'
    get '/relationships/followers', to: 'relationships#followers'
  end
  
  get '/admin', to: redirect('/admin/users')

end
