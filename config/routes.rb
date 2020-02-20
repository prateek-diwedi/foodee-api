# Rails.application.routes.draw do
  # resources :reviews
  # resources :ratings
  # resources :favourites
  # resources :users
#   resources :articles
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end

Rails.application.routes.draw do
<<<<<<< HEAD
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
=======
  namespace :api do

  resources :articles
  end

resource :session, only: [:new, :create, :destroy]
resources :users
resources :post_maps, only: [:index]

root "app#index"


resources :posts  do
  resources :favourites, only: [:create, :destroy]
  resources :reviews, only: [:create, :destroy]
  resources :rating, only: [:create, :destroy]

end


end



>>>>>>> 6353138897e30a43a721ba2b327355adceb8b73c
