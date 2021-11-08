class RestaurantController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @new_restaurant = Restaurant.new()

  end

  def update

  end

  def destroy
  end
end
