Rails.application.routes.draw do
  root 'home#index' # devise実装時の仮設定部分。マージするとき再考が必要

  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :items
  resources :discs
  resources :songs
  resources :carts
  resources :histroies
  resources :history_addresses
  resources :categories

end
