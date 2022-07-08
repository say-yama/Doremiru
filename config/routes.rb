Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
  sessions:      "admins/sessions",
  passwords:     "admins/passwords",
}
  devise_for :users, controllers: {
    sessions:      "users/sessions",
    passwords:     "users/passwords",
    registrations: "users/registrations"
  }
  
  namespace :admin do
    resources :reports,   only: [:index, :show, :update]
    resources :users,     only: [:index, :show, :update]
  end
  
  namespace :users do
    resources :users,       only: [:show, :edit, :updat, :likes, :check, :withdrawal]
  end
  
  root to: "homes#top"
  get "about" => "homes#about"
  get 'searches/search'
  resources :posts
  resources :reports,     only: [:new, :create]
  resources :categories
  get "search" => "searches#search"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
