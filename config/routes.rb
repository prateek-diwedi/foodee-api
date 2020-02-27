Rails.application.routes.draw do

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  post '/favourites', to: 'favourites#create'
  post '/reviews', to: 'reviews#create'
  post '/ratings', to: 'ratings#create'
  get '/find_review', to: 'reviews#find_review'
  get '/reviews' ,to: 'reviews#index'
  get '/find_favourite', to: 'favourites#find_favourite'
  delete '/favourites' , to: 'favourites#destroy'
  resources :users, only: [:create, :show, :index]
     resources :favourites
     resources :ratings
     resources :reviews
     resources :sessions
end
