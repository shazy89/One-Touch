class UsersController < ApplicationController
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
          binding.pry
          redirect_to root_path
        else  
           @message = @user.errors.full_messages
           redirect_to new_user_path
        end
    end
        
    
      private
        def user_params
          params.require(:user).permit(:username, :email, :first_name,:last_name, :password, :contact_number)
        end
        
    end

         
