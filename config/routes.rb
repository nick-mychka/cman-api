Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  defaults format: :json do
    # Defines the root path route ("/")
    root "welcome#index"

    resources :users, only: %i[create]

    post "/login", to: "users#login"
    get '/check_login', to: 'users#check_login'

    resources :clusters, only: %i[index create update destroy] do
      resources :coin_widgets, only: [:index, :create, :destroy, :update]
    end
  end
end
