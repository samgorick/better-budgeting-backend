Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, :transactions, :budgets, :savings, :saving_values
    post '/signup', to: 'users#create'
    post '/login', to: 'users#login'
    get '/login', to: 'users#show'
end
