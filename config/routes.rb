Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find',     to: "search#show"
        get '/find_all', to: "search#index"
      end
      namespace :transactions do
        get '/find',     to: "search#show"
        get '/find_all', to: "search#index"
      end
      namespace :customers do
        get '/find',     to: "search#show"
        get '/find_all', to: "search#index"
      end
      namespace :invoices do
        get '/find',     to: "search#show"
        get '/find_all', to: "search#index"
      end
      namespace :items do
        get '/find',     to: "search#show"
        get '/find_all', to: "search#index"
      end
      namespace :invoice_items do
        get '/find',     to: "search#show"
        get '/find_all', to: "search#index"
      end
      resources :merchants,     only: [:index, :show] do
        resources :items, only: [:index], controller: "merchant_items"
      end
      resources :transactions,  only: [:index, :show]
      resources :customers,     only: [:index, :show]
      resources :invoices,      only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :items,         only: [:index, :show]
    end
  end
end
