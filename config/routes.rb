Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  defaults format: :json do
    # Defines the root path route ("/")
    root "welcome#index"

    resources :users, only: %i[create]

    post "/login", to: "users#login"
    get "/check_login", to: "users#check_login"

    get "/coins_list", to: "coingeckos#coins_list"
    get "/top_popular_coins", to: "coingeckos#top_popular_coins"
    get "/exchanges", to: "coingeckos#exchanges"
    get "/exchange_tickers", to: "coingeckos#exchange_tickers"
    get "/coins_market_data", to: "coingeckos#coins_market_data"

    resources :clusters, only: %i[index create update destroy] do
      collection do
        put :update_clusters_order
      end

      resources :coin_widgets, only: %i[index create update destroy]
    end
  end
end
