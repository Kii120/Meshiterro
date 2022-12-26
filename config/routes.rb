Rails.application.routes.draw do
  
  # get 'users/show'
  # get 'users/edit'
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'

  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  # onlyを使うことで，resourcesが作ってくれるアクションを指定できる．
  resources :users, only: [:show, :edit, :update]
  
  devise_for :users
  # get 'homes/top'
  root to: "homes#top"
  
  get "homes/about", as: 'about'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
