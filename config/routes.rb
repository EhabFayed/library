Rails.application.routes.draw do

  root 'shops#home'
  get'about' ,to: 'shops#about'

  resources :books

  get'signup' ,to: 'users#new'
  resources :users, except:[:new]

  get 'login', to: 'seccions#new'
  post 'login', to: 'seccions#create'
  delete 'logout', to: 'seccions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
