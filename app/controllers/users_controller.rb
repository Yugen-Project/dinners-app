class UsersController < ApplicationController
  before_action :set_user 
    def index
      @users = User.all
    end

    def login
      render "devise/sessions/new"
    end

    def user_profile
      @order_history = @user.orders

    end
  
    def show
      @user = User.find(params[:id])
    end
  
    def create
      @new_user = User.new(user_params)
      if @new_user.save
        # render json: { status: 'success'}
        # render json: @new_user
      else
        # render json: { status: 'fail'}, status: 400
        # render error
      end
    end
  
    def update
      @user.update(room_params)
    end
  
    def destroy 
      @user.destroy
    end
  
    private
    #user id: nil, name: nil, description: nil, user_img_url: nil, tables: nil, location: nil, contact: nil, avail_tables: nil
    def set_user
      @user = current_user
  
    end
    def user_params
      params.require(:user).permit(:id, :name, :location, :description, :user_img_url, :tables, :avail_tables, :contact)
    end
  end
  