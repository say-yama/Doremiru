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

  namespace :admins do
    resources :users,     only: [:index, :show, :update]
    resources :categories, only: [:index, :create, :destroy]
    resources :genres,   only: [:index, :create, :destroy]
    resources :reports,   only: [:index, :show, :update]
  end

  namespace :user do
  end

  root to: "homes#top"
  get "about" => "homes#about"
  get 'searches/search'
  get 'genres/new'
  resources :posts do
    resources :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :destroy]
  end
  resources :reports,     only: [:new, :create]
  resources :users,       only: [:show, :edit, :update, :favorites, :check, :withdrawal] do
   member do
    get "withdrawal" => "users#withdrawal"
    patch "deleted" => "users#deleted"
    get "favorites" => "users#favorites"
   end
  end
  patch "users/:id" => "users#update"
  get "search" => "posts#search"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
