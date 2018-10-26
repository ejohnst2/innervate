Rails.application.routes.draw do
  get 'ideas/create'
  get 'ideas/update'
  get 'ideas/delete'
  get 'ideas/index'
  get 'teams/create'
  get 'teams/index'
  get 'teams/update'
  get 'teams/delete'

# API routing
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :ideas, only: [ :index, :show, :create ]
    end
  end

# devise routes for user authentication
  devise_for :users

#routing to the ReactJS SPA
  root to: 'pages#home'
  get "ideas/:id", to: 'pages#home'
  get "ideas/new", to: 'pages#home'

#routing for the landing page
  get "/landing", to: "pages#landing"

end
