class SelectItem < ApplicationRecord
  belongs_to :product
  belongs_to :table

  def total
    self.quantity * self.product.price
  end

  def self.product_and_table(params)
    self.where("product_id = ? AND table_id = ? ", params[:product_id], params[:table_id])
  end
end
