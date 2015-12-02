Rails.application.routes.draw do
  root 'static_pages#home'
  get 'signup' => 'users#new'
  # get 'user/:id' => 'users#show'
  resources :users
end
