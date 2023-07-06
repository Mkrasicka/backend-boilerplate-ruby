Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/ping', to: 'ping#show', format: :json, as: :ping
  resources :accounts, only: [:show] do
    resources :transactions, only: [:index, :create]
  end
end
