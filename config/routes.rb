Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :users do
  end

  get '/users/:id/category', to: 'users#categories', as: 'user_categories'
  post '/users/:id/category', to: 'users#category'
  get '/Running/:id', to: 'users#running', as: 'user_Running'
  get '/Biking/:id', to: 'users#biking', as: 'user_Biking'
  get '/Swimming/:id', to: 'users#swimming', as: 'user_Swimming'

  get '/Running/:id/goals/new', to: 'goals#new', as: 'Running_goal'
  get '/Biking/:id/goals/new', to: 'goals#new', as: 'Biking_goal'
  get '/Swimming/:id/goals/new', to: 'goals#new', as: 'Swimming_goal'
  post '/Running/:id/goals', to: 'goals#create'
  post '/Biking/:id/goals', to: 'goals#create'
  post '/Swimming/:id/goals', to: 'goals#create'
  get '/Running/:id/goals', to: 'goals#show', as: 'Running_goal_show'
  get '/Biking/:id/goals', to: 'goals#show', as: 'Biking_goal_show'
  get '/Swimming/:id/goals', to: 'goals#show', as: 'Swimming_goal_show'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
