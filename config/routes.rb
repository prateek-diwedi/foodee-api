# Rails.application.routes.draw do
  # resources :reviews
  # resources :ratings
  # resources :favourites
  # resources :users
#   resources :articles
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end

Rails.application.routes.draw do
  # resources :reviews
  # resources :ratings
  # resources :favourites
  # resources :users
  namespace :api do
   namespace :v1 do
    resources :users
    resources :favourites
    resources :ratings
    resources :reviews
    resources :articles
   end
  end
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end
