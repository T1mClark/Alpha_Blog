Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  # Map the restful commands:
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, destroy]
  # Does the same as above.
  resources :articles
end
