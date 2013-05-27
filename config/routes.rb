MlStaffer::Application.routes.draw do
  devise_for :users

  resources :users

  root :to => "directory#index"
end
