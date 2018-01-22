Rails.application.routes.draw do
  root 'home#index' # devise実装時のリダイレクト先　暫定設定

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

  get "/users/show" => "users#show"  #マイページ
  delete "/users/destroy" =>"users#destroy" #論理削除

end
