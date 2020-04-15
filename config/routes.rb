Rails.application.routes.draw do
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  get 'tags/:tag', to: 'posts#index', as: :tag
  devise_for :users
  root to: 'posts#index'
  namespace :posts do
    resources :searches, only: :index
  end
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
  end
  resources :users, only: :show
end
