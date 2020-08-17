class SelectItemsController < ApplicationController
    
    def index
    end

   def select_item
    @user= current_user
         #binding.pry
    @item = SelectItem.create(item_params)
       redirect_to user_path(@user)
   
    end
       
      

private 
def item_params
    
  end

end

