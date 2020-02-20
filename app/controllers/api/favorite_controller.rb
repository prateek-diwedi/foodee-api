class Api::FavouritesController < ApplicationController
before_action :find_restaurant, only: [:create]
before_action :find_favourite, only: [:destroy]


def create
  favourite = Favourite.new user: current_user, restaurant: @restaurant

  if favourite.save
    redirect_to @restaurant, notice: "thanks for favouriting"
  else
    redirect_to @restaurant, alert: favourite.errors.full_messages.join(', ')
  end
end

def destroy
  if @favourite.destroy
    redirect_to @favourite.restaurant, notice: ":("
  else
    redirect_to @favourite.restaurant, alert: @favourite.errors.full_messages.join(', ')
  end
end

private
def find_favourite
  @favourite = Favourite.find(params[:id])
end

def find_restaurant
  @restaurant = restaurant.find(params[:res_id])
end
end