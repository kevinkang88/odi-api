Rails.application.routes.draw do
  post 'auth/authorize', to: 'users#authorize_device'
  get 'test', to: 'users#test'
  get 'secret', to: 'users#create_secret'
  resources :profiles, only: [:index]
end
