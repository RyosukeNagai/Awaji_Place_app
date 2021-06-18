Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  
  resources :posts, only: [:show] do 
    resources :reviews, only: [:index, :create, :destroy]
  end

  namespace :admin do
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
    resources :tags, only: [:index, :create, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
