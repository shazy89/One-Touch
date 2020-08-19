class UsersController < ApplicationController
    before_action :set_user, except: [:index, :new, :create]
    skip_before_action :online_user, only: [:new, :create]
    
    def new
       
        @user = User.new
      end
    
      def create
        @user = User.new(user_params)

        if @user.save && !logged_in? 
          session[:user_id] = @user.id
          @user.admin_or_employee
          @user.normalize_phone_number
          @user.save
  
          redirect_to root_path
        else  
       
         flash[:errors] = @user.errors.full_messages
         redirect_to new_user_path
      end
    
        
    end

    def edit
    end

    def update
 
        if @user.update(user_params)
            @user.normalize_phone_number
            @user.save
            redirect_to user_path(@user)
        else
            redirect_to edit_user_path(@user)
        end
    end

    def show

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
      
   # flash = {error: [“Username must exist”}flash[:errors]
      

    

         
