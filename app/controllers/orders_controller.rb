class OrdersController < ApplicationController
  before_action :authenticate_user!  
      def index
        @orders = Order.all
      end
    
      def show
        @order = Order.find(params[:id])
      end
    
      def create
        @new_order = Order.new(order_params)
        if @new_order.save
          # render json: { status: 'success'}
          render json: @new_order
        else
          render json: { status: 'fail'}, status: 400
          # render error
        end
      end
    
      def update
        @order.update(room_params)
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
        params.require(:order).permit(:id, :date, :quantity, :restaurant_id, :meal_id)
      end
end
