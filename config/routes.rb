Rails.application.routes.draw do
  resources :profiles
  devise_for :users
  root 'static_pages#index'
end
