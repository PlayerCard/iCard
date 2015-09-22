Rails.application.routes.draw do
  resources :rosters
  resources :rosters
  resources :teams
  resources :profiles
  devise_for :users
  root 'static_pages#index'
end
