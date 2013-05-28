MlStaffer::Application.routes.draw do
  devise_for :users

  resources :users

  get '/auth/:provider/callback', to: 'callbacks#create'

  root :to => "directory#index"
end
