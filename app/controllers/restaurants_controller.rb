class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    # @review = @restaurant.reviews.build
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
    # will be replaced with the page for the newly created restaurant.
    redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
