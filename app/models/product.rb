class Product < ApplicationRecord
    has_many :select_items
    belongs_to :user
    
    validates :title, presence: true, uniqueness: true
    validates :price, presence: true

    scope :sorted_title, -> { self.order(title: :desc)}
    scope :search, -> (term) { self.sorted_title.where("title LIKE ?", "%#{term}%") }
    
    def  self.products_all
        self.all.each do |product| 
            product.title
            form_tag "/select_items" do
            hidden_field_tag :product_id, product.id
            hidden_field_tag :table_id, @table.id 
            number_field_tag :quantity, 1
            submit_tag "Add to List"
         end
      end
    end
            

    

end
