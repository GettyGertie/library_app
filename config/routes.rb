Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'bookup' => 'books#new'

  post 'bookup' => 'books#create'

  get 'logins/new'

 root 'layouts#home'

  get 'signup' => 'users#new'

  get 'contact' => 'layouts#contact'

  get 'about' => 'layouts#about'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :books

  resources :users

  resources :account_activations, only: [:edit]

  resources :password_resets, only: [:new, :create, :edit, :update]
  
end
