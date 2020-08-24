class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :actrive_user, only: [:new, :create ]

  
    
    def index
        if current_user.id == params[:user_id].to_i && params[:term]
           userProducts ||= User.find(params[:user_id])
            @products = userProducts.products.search(params[:term])
         elsif current_user.id == params[:user_id].to_i
            userProducts ||= User.find(params[:user_id])
            @products = userProducts.products.sorted_title
        else 
            @message = flash[:errors] = "You have no access."
            redirect_to root_path
        end
    end
         
            
            
    def new 
        if current_user.id == params[:user_id].to_i
        @product = Product.new
        else
          @message = flash[:errors] = "You have no access."
          redirect_to new_user_product_path(current_user)
        end
    end
  
    def create

        if current_user.id == params[:user_id].to_i
          
            @product = current_user.products.build(product_params)
            @product.save
            redirect_to user_products_path
        else
            flash[:errors] = @product.errors.full_messages
            redirect_to new_user_product_path
        end
    end
 

    
    def show
    end
        
    def edit
    end
        
    def update
        if  @product.update(product_params)
            redirect_to user_products_path
        else
            redirect_to root_path
        end
    end

    def destroy
 
        if  @product.select_items.present?
            flash[:errors] = " Product in use "
            redirect_to user_products_path(current_user)
        else
            @product.destroy
            redirect_to user_products_path(current_user)
        end
    end
 
    private
    def set_product
      @product = Product.find(params[:id])
    end


    def product_params
      params.require(:product).permit(:title, :price)
    end

    def actrive_user
        @user = current_user
    end
    
end
 




     
        
      
        




    
  



      
  

