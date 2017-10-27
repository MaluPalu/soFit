Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :users do
  end

  get '/users/:id/category', to: 'users#categories', as: 'user_categories'
  post '/users/:id/category', to: 'users#category'
  get '/category/:id', to: 'users#running', as: 'user_Running'

  get '/category/:id/goals/new', to: 'goals#new', as: 'category_goal'
  post '/category/:id/goals', to: 'goals#create'
  get '/category/:id/goals/:id', to: 'goals#show', as: 'category_goal_show'

  get '/goals/:id/tracking/new', to: 'trackings#new', as: 'goal_tracking'
  post '/goals/:id/tracking', to: 'trackings#create'
  delete '/trackings/:id', to: 'goals#delete_tracking'
  get 'goals/:goal_id/tracking/:id/edit', to: 'trackings#edit', as: 'edit_tracking'
  patch 'goals/:goal_id/tracking/:id', to: 'trackings#update'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
