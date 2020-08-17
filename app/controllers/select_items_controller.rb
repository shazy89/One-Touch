class SelectItemsController < ApplicationController
    
    def index
    end

   def select_item
    @user= current_user
         binding.pry
    @item = SelectItem.create(quantity: params[:quantity], product_id: params[:product_id])
       redirect_to user_path(@user)
   
    end
       
      



end

