class SelectItemsController < ApplicationController
  before_action :set_selected_item, only: [:show, :edit, :update]
  
  def edit
    binding.pry
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

private

def set_selected_item
   @item = SelectItem.find_by_id(params[:id])
end
    
 end
    
 

       
      




