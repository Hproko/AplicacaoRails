Rails.application.routes.draw do
  resources :esportes
  
  resources :estados
  resources :pessoas
  resources :users
  
  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
  root   'sessions#new'
  get    'home/principal' => 'home#principal'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
