Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:edit, :create, :index, :show, :update , :destroy ]do
end
  resources :users, only: [:index, :show, :edit, :update ]
  get 'home/about'
  root 'home#top'
  end