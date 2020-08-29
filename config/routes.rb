Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticated :user do
    root 'activities#index', as: :authenticated_root
  end
  root "static_pages#home"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :activities
  resources :totals, only: [:index]
  resources :shoes, except: [:show]
end
