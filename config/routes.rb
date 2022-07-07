Rails.application.routes.draw do
  namespace :admin do
    resources :reports,   only: [:index, :show, :update]
  end
  namespace :admin do
    resources :users,     only: [:index, :show, :update]
  end
  
  root to: "homes#top"
  resources :homes,       only: [:about]
  resources :posts
  resources :users,       only: [:show, :edit, :updat, :likes, :check, :withdrawal]
  resources :reports,     only: [:new, :create]
  resources :categories

  devise_for :admins, controllers: {
  sessions:      "admins/sessions",
  passwords:     "admins/passwords",
  registrations: "admins/registrations"
}
devise_for :users, controllers: {
  sessions:      "users/sessions",
  passwords:     "users/passwords",
  registrations: "users/registrations"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
