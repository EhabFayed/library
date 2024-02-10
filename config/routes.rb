Rails.application.routes.draw do

  root 'shops#home'
  get'about' ,to: 'shops#about'

  resources :books

  get'signup' ,to: 'users#new'
  resources :users, except:[:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
