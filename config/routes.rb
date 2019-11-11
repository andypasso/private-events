Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to:  'users#new_session', as: 'login'
  post 'login', to: 'users#create_session', as: 'create_session'
  get 'logout', to: 'users#destroy', as: 'logout'
  
  resources :users
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
