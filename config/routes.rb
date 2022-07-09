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

  namespace :user do
  end

  root to: "homes#top"
  get "about" => "homes#about"
  get 'searches/search'
  resources :posts do
    resources :favorites, only: [:create, :destroy]
  end
  resources :reports,     only: [:new, :create]
  resources :categories
  resources :users,       only: [:show, :edit, :updat, :favorites, :check, :withdrawal] do
   member do
    get "favorites" => "users#favorites"
   end
  end

  patch "users/:id" => "users#update"
  get "search" => "searches#search"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
