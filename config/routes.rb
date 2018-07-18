Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/home',    to: 'static_pages#home'
  get  '/contact', to: 'static_pages#contact'
  get '/todos', to: 'static_pages#todos'
  get '/register',   to: 'users#new'
  post '/register',  to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # put '/todone', to: 'todos#todone'

  resources :users
  resources :todos, only: [:create, :update, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
