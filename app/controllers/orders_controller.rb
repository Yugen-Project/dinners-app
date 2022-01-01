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
        p "create called"
        @new_order = Order.new(date: DateTime.now(), restaurant_id: params[:restaurant], meal_id: params[:meal] , user_id: current_user.id, quantity:1)
        p @new_order.valid?
        if @new_order.save
          # render json: { status: 'success'}
          flash[:notice] = " #{Meal.find(params[:meal]).name} added to cart"
          @res = true
          p "success!"
        else
          flash[:notice] = "could not add to cart"
          
          @res = false
          # render error
        end

        p "create called end"
      end
      def cart

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
