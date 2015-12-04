Rails.application.routes.draw do
  root        'static_pages#home'
  get         'signup'    => 'users#new'
  # get 'user/:id' => 'users#show'
  get         'login'     => 'sessions#new'
  post        'login'     => 'sessions#create'
  delete      'logout'    => 'sessions#destroy'
  # get         'settings'  => 'users#edit'
  resources :users
end
