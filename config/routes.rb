Rails.application.routes.draw do
  
  # get 'users/show'
  # get 'users/edit'
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  
  # これ一番
  devise_for :users
  # get 'homes/top'
  root to: "homes#top"
  
  get "homes/about", as: 'about'
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  # onlyを使うことで，resourcesが作ってくれるアクションを指定できる．
  resources :users, only: [:show, :edit, :update]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
