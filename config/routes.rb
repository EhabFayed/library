Rails.application.routes.draw do

  root 'shops#home'
  get'about' ,to: 'shops#about'

  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end