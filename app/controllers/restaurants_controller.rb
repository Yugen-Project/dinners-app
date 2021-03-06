class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [ :checkout]
  before_action :set_restaurant
  
  def index
    @restaurants = Restaurant.all
  end

  def checkout
      @resaurrant = Restaurant.find(params[:id])
      @meal = Meal.find(params[:meal])
      @date = DateTime.now()
      @user = current_user
      set_flash_notice = "order complete"
  end
  
  def show

    @restaurant
    p "show was triggered"

  end

  def create
    @new_restaurant = Restaurant.new(restaurant_params)
    if @new_restaurant.save
      # render json: { status: 'success'}
      # render json: @new_restaurant
    else
      # render json: { status: 'fail'}, status: 400
      # render error
    end
  end

  def update
    @restaurant.update(room_params)
  end

  def destroy 
    @restaurant.destroy
  end

  private
  # #Restaurant id: nil, name: nil, description: nil, restaurant_img_url: nil, tables: nil, location: nil, contact: nil, avail_tables: nil
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  def restaurant_params
    params.require(:restaurant).permit(:id, :name, :location, :description, :restaurant_img_url, :tables, :avail_tables, :contact)
  end
end
