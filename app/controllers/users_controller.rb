class UsersController < ApplicationController
    before_action :set_user, except: [:index, :new, :create]

    def new
        @user = User.new
      end
    
      def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          @user.admin_or_employee
          @user.normalize_phone_number
          @user.save
         # binding.pry
          redirect_to root_path
        else  
           @message = @user.errors.full_messages
           redirect_to new_user_path
        end
    end

    def edit
        @user = current_user
  
          #binding.pry
    end

    def update
        @user = User.find_by_id(params[:id])
        if @user.update(user_params)
            redirect_to root_path
        else
            redirect_to edit_user_path
        end
    end

    def destroy
        @user.destroy
        redirect_to root_path
    end
    
    private
      def user_params
        params.require(:user).permit(:username, :email, :first_name,:last_name, :password, :contact_number)
      end
        
      def set_user
        @user = User.find_by_id(params[:id])
      end
    
        
    end

         
