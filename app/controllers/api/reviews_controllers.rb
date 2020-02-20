class Api::ReviewsController < ApplicationController
  before_action :authenticate_user!
  
    def create
      @restaurant = Reastaurant.find params[:rest_id]
      @review = @restaurant.reviews.build(review_params)
      @review.user = current_user
  
      if @review.save
        redirect_to post_path(@restaurant)
      else
        @reviews = @restaurant.reviews.order(create_at: :desc)
        render 'restaurants/show'
      end
    end
  
    def destroy
  
      review = review.find params[:id]
      if can?(:destroy, review)
        review.destroy
        redirect_to restaurant_path(review.restaurant)
      else
        head :unauthorized
      end
    end
  
    private
    def review_params
      params.require(:review).permit(:body, :rating)
    end
  
  
  end