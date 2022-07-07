Rails.application.routes.draw do
  namespace :admin do
    get 'reports/index'
    get 'reports/show'
    get 'reports/update'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/update'
  end
  get 'reports/new'
  get 'reports/create'
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/destroy'
  get 'posts/search'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/likes'
  get 'users/check'
  get 'users/withdrawal'
  get 'homes/top'
  get 'homes/about'
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
