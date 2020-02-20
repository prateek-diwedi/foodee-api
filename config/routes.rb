Rails.application.routes.draw do
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



