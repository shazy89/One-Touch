class SelectItem < ApplicationRecord
  belongs_to :product
  belongs_to :table

      
  def total
    self.quantity * self.product.price 
  end

  def before_save
    if self.product_id == params[:product_id]
       self.quantity += params[:quantity]
       self.save 
    end
  end  

  def self.all_product_and_table_ids 
    self.all.each do |item| 
      item.product_id
      item.table_id
    end
  end


end


  


