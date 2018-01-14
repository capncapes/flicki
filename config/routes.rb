Rails.application.routes.draw do
  get 'users/show'
  post 'users/downgrade'

  resources :wikis
  resources :charges, only: [:new, :create]

  devise_for :users
  
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
