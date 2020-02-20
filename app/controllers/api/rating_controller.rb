class Api::RatingsController < ApplicationController
  before_action :authenticate_user!
  
    def create
      @restaurant = Restaurant.find params[:res_id]
      @rating = @restaurant.ratings.build(rating_params)
      @rating.user = current_user
  
      if @rating.save
        redirect_to restaurant_path(@restaurant)
      else
        @ratings = @restaurant.ratings.order(create_at: :desc)
        render 'restaurants/show'
      end
    end
  
    def destroy
  
      rating = Rating.find params[:id]
      if can?(:destroy, rating)
        rating.destroy
        redirect_to restaurant_path(rating.restaurant)
      else
        head :unauthorized
      end
    end
  
    private
    def rating_params
      params.require(:rating).permit(:body, :rating)
    end
  
  
  end