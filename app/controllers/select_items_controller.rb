class SelectItemsController < ApplicationController
  before_action :set_selected_item, only: [:show, :edit, :update, :destroy]
  
  def edit

  end

   
   def update
      if  @item.update(select_item_params)
          #binding.pry
        redirect_to table_path(@item.table)
      else
        redirect_to root_path
      end
   end

   def destroy  
    @item.destroy
    redirect_to table_path(@item.table)
   end


   def select_item
       @user= current_user
       @item = SelectItem.create(quantity: params[:quantity], product_id: params[:product_id], table_id: params[:table_id])
       if @item.save
         redirect_to table_path(@item.table_id)
        else 
          redirect_to root_path
      end
   end
   
   private
   
   def set_selected_item
      @item = SelectItem.find_by_id(params[:id])
   end
   
   def  select_item_params
     params.require(:select_item).permit(:table_id, :product_id, :quantity)
   end
       
    end
    
       


       


     

      

 

       
      




