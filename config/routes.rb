Rails.application.routes.draw do
  
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/destroy'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/new'
    get 'genres/edit'
    get 'genres/create'
    get 'genres/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'relationships/create'
    get 'relationships/destroy'
    get 'relationships/followings'
    get 'relationships/followers'
  end
  namespace :public do
    get 'comments/create'
    get 'comments/destroy'
  end
  namespace :public do
    get 'posts/new'
    get 'posts/index'
    get 'posts/show'
    get 'posts/create'
    get 'posts/destroy'
  end
  namespace :public do
    get 'users/mypage'
    get 'users/edit'
    get 'users/show'
    get 'users/update'
  end
  namespace :user do
    get 'users/mypage'
    get 'users/edit'
    get 'users/show'
    get 'users/update'
  end
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
}
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
}
#管理者側
  namespace :admin do
    resources :genres, except: [:show]
    resources :users, only: [:index, :show, :destroy]
  end
  
  scope module: :public do
    root to: "homes#top"
    get '/about', to: 'homes#about'
    get '/mypage', to: 'users#mypage'
    resources :users, only: [:show, :edit, :update]
    resources :posts, except: [:edit, :update]
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :relationships, only: [:create, :destroy]
    get '/relationships/followings', to: 'relationships#followings'
    get '/relationships/followers', to: 'relationships#followers'
  end

end