class MealsController < ApplicationController
    def index
        @meals = Meal.all
      end
    
      def show
        @meal = Meal.find(params[:id])
      end
    
      def create
        @new_meal = Meal.new(meal_params)
        if @new_meal.save
          # render json: { status: 'success'}
          render json: @new_meal
        else
          render json: { status: 'fail'}, status: 400
          # render error
        end
      end
    
      def update
        @meal.update(room_params)
      end
    
      def destroy 
        @meal.destroy
      end
    
      private
      #Meal id: nil, name: nil, description: nil, meal_img_url: nil, price: nil, created_at: nil, updated_at: nil, restaurant_id: nil
      def set_meal
        @meal = Meal.find(params[:id])
    
      end
      def meal_params
        params.require(:meal).permit(:id, :name, :price, :description, :meal_img_url, :restaurant_id)
      end
end
