Rails.application.routes.draw do

  # get 'users/show'
  # get 'users/edit'
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'

  # これ一番最初に書く
  devise_for :users
  # get 'homes/top'
  root to: "homes#top"

  get "homes/about", as: 'about'

  # onlyを使うことで，resourcesが作ってくれるアクションを指定できる
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    # resourceと単数形にすることで/:idがURLに含まれなくなる→いいね機能は存在するかしないかの二択なので，idは
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
