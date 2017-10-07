Rails.application.routes.draw do

  root to: 'toppages#index'
  delete 'logout', to: 'users#destroy'
  
  resources :users, only: [:show, :new ,:create ,:destroy]
  
  resources :sessions, only: [:create, :destroy]

  resources :chems, only: [:new, :create, :edit, :destroy] do
     resources :enterings, only: [:new, :create]
  end

  resources :historys, only: [:show]

  resources :chems, only: [:new, :create, :edit, :destroy] do
     resources :dispatchings, only: [:new, :create]
  end

  #resources :dispatchings, only: [:new, :create]
  

  #resources :enterings, only: [:new, :create]

  resources :serchings, only: [:show]






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


