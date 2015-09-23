Rails.application.routes.draw do
  resources :teams
  resources :profiles
  devise_for :users
  resources :games do
    resources :cards
  end
  get '/user/show' => 'user#show', as: :user_root
  root 'static_pages#index'
end
