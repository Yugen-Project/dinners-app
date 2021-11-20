class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
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

  # private
  # #Restaurant id: nil, name: nil, description: nil, restaurant_img_url: nil, tables: nil, location: nil, contact: nil, avail_tables: nil
  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:id])

  # end
  # def restaurant_params
  #   params.require(:restaurant).permit(:id, :name, :location, :description, :restaurant_img_url, :tables, :avail_tables, :contact)
  # end
end
