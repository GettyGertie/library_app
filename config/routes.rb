Rails.application.routes.draw do

  get 'books/new'

  get 'logins/new'

 root 'books#new'

  get 'signup' => 'users#new'

  get 'contact' => 'layouts#contact'

  get 'about' => 'layouts#about'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :users
  
  resources :books
end
