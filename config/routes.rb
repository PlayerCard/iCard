Rails.application.routes.draw do
  resources :rosters
  resources :teams
  resources :profiles
  devise_for :users
  get '/user/show' => 'user#show', as: :user_root
  root 'static_pages#index'
end
