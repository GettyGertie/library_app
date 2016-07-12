Rails.application.routes.draw do

  get 'logins/new'

 root 'layouts#home'

  get 'signup' => 'users#new'

  get 'contact' => 'layouts#contact'

  get 'about' => 'layouts#about'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
