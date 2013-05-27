MlStaffer::Application.routes.draw do
  devise_for :users

  root :to => "directory#index"
end
