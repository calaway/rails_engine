Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      namespace :merchants do
        get '/find',     to: "search#show"
        get '/find_all', to: "search#index"
        get '/random',   to: "search#random"
        get '/:id/invoices', to: "invoices#index", as: "invoices"
        get '/:id/items', to: "items#index", as: "items"
      end
      namespace :transactions do
        get '/find',     to: "search#show"
        get '/find_all', to: "search#index"
        get '/random',   to: "search#random"
        get '/:id/invoice', to: "invoices#show", as: "transactions"
      end
      namespace :customers do
        get '/find',     to: "search#show"
        get '/find_all', to: "search#index"
        get '/random',   to: "search#random"
        get '/:id/invoices', to: "invoices#index", as: "invoices"
        get '/:id/transactions', to: "transactions#index", as: "transactions"
      end
      namespace :invoices do
        get '/find',     to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "search#random"
        get '/:id/transactions', to: "transactions#index", as: "transactions"
        get '/:id/invoice_items', to: "invoice_items#index", as: "invoice_items"
        get '/:id/items', to: "items#index", as: "items"
        get '/:id/customer', to: "customers#show", as: "customer"
        get '/:id/merchant', to: "merchants#show", as: "merchant"
      end
      namespace :items do
        get '/find',     to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "search#random"
        get '/:id/merchant', to: "merchants#show", as: "merchant"
        get '/:id/invoice_items', to: "invoice_items#index", as: "invoice_items"
      end
      namespace :invoice_items do
        get '/find',     to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "search#random"
        get '/:id/invoice', to: "invoices#show", as: "invoice"
        get '/:id/item', to: "items#show", as: "item"
      end
      resources :merchants,      only: [:index, :show] do
      end
      resources :transactions,   only: [:index, :show] do
      end
      resources :customers,      only: [:index, :show] do
      end
      resources :invoices,       only: [:index, :show] do
        resources :transactions, only: [:index], controller: "invoice_transactions"
      end
      resources :invoice_items,  only: [:index, :show]
      resources :items,          only: [:index, :show]
    end
  end
end
