Rails.application.routes.draw do

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  #ゲストユーザー側
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  
  #ユーザー側
scope module: :public do
  root to: "homes#top"
  get '/about' => "homes#about", as: 'about'
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  get 'user/users/mypage', to: 'users#mypage'
  resources :users, only: [:show, :edit, :update, :mypage] do
    member do
      get 'likes', to: 'favorites#show'
    end
    resource :relationships, only: [:create, :destroy] do
      get :followings
      get :followers
    end
  end
  resources :posts, only: [:edit, :update, :new, :create, :show] do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
end


  # 管理者側
  namespace :admin do
    resources :genres, except: [:show]
    resources :users, only: [:index, :show, :destroy]
    resources :comments, only: [:index, :destroy]
  end

  get '/admin', to: redirect('/admin/sign_in')
  get "search" => "searches#search"
  get "genre_search" => "searches#genre_search"
  get "sex_search" => "searches#sex_search"
  
end
