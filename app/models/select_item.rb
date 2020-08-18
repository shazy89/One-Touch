class SelectItem < ApplicationRecord
  belongs_to :product
  belongs_to :table

      
  def total
    self.quantity * self.product.price 
  end

end



  



