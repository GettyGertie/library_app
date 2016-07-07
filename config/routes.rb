Rails.application.routes.draw do
  get 'users/new'

  get 'layouts/home'

  get 'layouts/contact'

  get 'layouts/about'

 root 'layouts#home'

  get 'contact' => 'layouts#contact'

  get 'about' => 'layouts#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
