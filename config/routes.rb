Rails.application.routes.draw do
  root   'home#index'
  get    'edit'    => 'home#edit'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'signup'  => 'users#new'
  get    'preview' => 'profiles#preview'
  get    'show/:id'=> 'profiles#show'
  resources :users
  resources :experiences
  resources :projects 
  resources :profiles , only: [:update]
  resources :educations , only: [:new]
  
end
