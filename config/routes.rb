Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  resources :users, except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to:'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #this line gave us a new article path , patch path , delete path, show path, index path simply by
  resources :articles
end
