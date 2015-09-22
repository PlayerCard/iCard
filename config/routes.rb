Rails.application.routes.draw do
  resources :profiles
  devise_for :users
  root 'welcome#index'
end
