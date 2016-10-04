Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :invoices do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "search#random"
      end
      namespace :items do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "search#random"
      end
      namespace :invoice_items do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "search#random"
      end
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :items, only: [:index, :show]
    end
  end
end
