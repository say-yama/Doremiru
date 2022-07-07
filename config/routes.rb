Rails.application.routes.draw do
  get 'searches/search'
  namespace :admin do
    resources :reports,   only: [:index, :show, :update]
    resources :users,     only: [:index, :show, :update]
  end
  
  namespace :users do
    devise_for :users, controllers: {
      sessions:      "users/sessions",
      passwords:     "users/passwords",
      registrations: "users/registrations"
    }
  end
  
  root to: "homes#top"
  get "about" => "homes#about"
  resources :posts
  resources :users,       only: [:show, :edit, :updat, :likes, :check, :withdrawal]
  resources :reports,     only: [:new, :create]
  resources :categories
  get "search" => "searches#search"

  devise_for :admins, controllers: {
  sessions:      "admins/sessions",
  passwords:     "admins/passwords",
  registrations: "admins/registrations"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
