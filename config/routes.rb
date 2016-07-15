Rails.application.routes.draw do

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



  resources :users
  
end
