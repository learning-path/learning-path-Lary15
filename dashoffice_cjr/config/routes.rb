Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { sessions: 'users/sessions',
  registrations: 'users/registrations'}

  root to: 'main#index'
  resources :customers

  # For the API
  namespace :v1, defaults: { format: :json } do
    resources :customers
    resource :login, only: [:create], controller: :sessions
  end
end
