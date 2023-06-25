Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  resources :users, except: [:new]

  #this line gave us a new article path , patch path , delete path, show path, index path simply by
  resources :articles
end
