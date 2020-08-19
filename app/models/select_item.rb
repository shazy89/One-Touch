class SelectItem < ApplicationRecord
  belongs_to :product
  belongs_to :table

      
  def total
    self.quantity * self.product.price 
  end

  def before_save
    if item.product_id == params[:product_id]
       ite.quantity += params[:quantity]
       item.save 
    end
  end  


end



  


