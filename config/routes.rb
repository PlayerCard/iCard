Rails.application.routes.draw do
  resources :teams
  resources :profiles
  devise_for :users
  root 'welcome#index'
end
