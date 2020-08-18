class SelectItemsController < ApplicationController
    
    def index
    end

   def select_item
    @user= current_user
    @item = SelectItem.create(quantity: params[:quantity], product_id: params[:product_id], table_id: params[:table_id])
    @table = @item.table.id
      if @item.save
        #binding.pry
       redirect_to table_path(@table)
      else 
        redirect_to root_path
        
       end
    end
    
 end
    
 

       
      




