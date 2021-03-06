class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  def find_review
    # @review = Review.find_by(res_id: params[:res_id] limit : nil)
    @review = Review.where(res_id: params[:res_id]).to_a
    # @review = Review.find(:all, :conditions => { :res_id => params[:res_id] })
    # @review = Review.all
    # @review = Review.find_by_sql("SELECT * FROM reviews WHERE ")
    render json: @review
  end
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
    render json: @reviews
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    render json: @reviews
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    # @review.destroy
    # respond_to do |format|
    #   format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
    #   format.json { head :no_content }
      @review = Review.find params[:id]
      if can?(:destroy, review)
       @review.destroy
       redirect_to root_path(review.res_id)
      else
       head :unauthorized
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:user_id, :res_id, :review_text, :rating)
    end
end
