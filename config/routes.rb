Rails.application.routes.draw do

  # get 'password_resets' => 'password_resets#new'

  # get 'password_resets' => 'password_resets#edit'

  get 'bookup' => 'books#new'

  post 'bookup' => 'books#create'

  get 'borrow' => 'books#borrow'
  get 'borrowed' => 'books#borrowed_books'
  get 'give' => 'books#give_book'
  get 'given_away' => 'books#given_away_books'
  get 'returned' => 'books#return'

 root 'layouts#home'

  get 'signup' => 'users#new'

  get 'contact' => 'layouts#contact'

  get 'about' => 'layouts#about'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

default_url_options :host => 'localhost:3000'

  resources :books

  resources :users

  resources :account_activations, only: [:edit]

  resources :password_resets, only: [:new, :create, :edit, :update]
  
end
