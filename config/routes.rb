Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations'
    }

  get 'home/index'

  resources :posts do
      resources :comments, shallow: true
  end
resources :comments, only: [:index]
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
