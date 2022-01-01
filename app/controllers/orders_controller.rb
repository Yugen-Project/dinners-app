class OrdersController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_order, only: :show 
      def index
        @orders = Order.all
      end
    
      def show
        @order = Order.find(params[:id])
      end
    
      def create
        @new_order = Order.new(order_params)
        @new_order.id = nil
 
        if @new_order.save
          flash[:notice] = " #{Meal.find(order_params[:meal_id]).name} added to cart"
          @res = true
          p "success!"
          flash[:notice] = "order complete"

        else
          
          @res = false
        end
    
        p "create called end"
      end
      def cart

      end
    
      def update
        @order.update(order_params)
      end
    
      def destroy 
        @order.destroy
      end
    
      private
      #<Order id: nil, date: nil, quantity: nil, created_at: nil, updated_at: nil, restaurant_id: nil, meal_id: nil
      def set_order
        @order = Order.find(params[:id])
    
      end
      def order_params
        params.permit(:id,:date, :quantity, :restaurant_id, :meal_id, :user_id)
      end
end
