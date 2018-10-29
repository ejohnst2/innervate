Rails.application.routes.draw do

# automatic rails routes
  get 'ideas/create'
  get 'ideas/update'
  get 'ideas/delete'
  get 'ideas/index'
  get 'teams/create'
  get 'teams/index'
  get 'teams/update'
  get 'teams/delete'

# post and get requests for Slack - API endpoints
  post '/Idea', to: 'api/v1/slack_interactions#create', :defaults => { :format => 'json' }

# API routing
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :ideas, only: [ :index, :show, :create ]
    end
  end

# devise routes for user authentication
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get "/auth/slack/callback", to: 'pages#home'

#routing to the ReactJS SPA
  root to: 'pages#home'
  get "ideas/:id", to: 'pages#home'
  get "ideas/new", to: 'pages#home'

#routing for the landing page
  get "/landing", to: "pages#landing"
  get "/index", to: "pages#index"
end
