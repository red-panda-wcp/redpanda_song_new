Rails.application.routes.draw do

devise_for :admins, controllers: {
        registrations: 'admins/registrations',
        sessions: 'admins/sessions'
      }
  # devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/" => "items#index"
  resources :items,only: [:new, :create, :index, :show, :update, :edit, :destroy] do
  resources :discs
  resources :songs
  resources :carts
  resources :histroies
  resources :history_addresses
  resources :categories,only: [:new, :create, :index, :update, :edit, :destroy] do

  resources :admin_users

end
end
end