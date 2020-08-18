class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
        @product = Product.all
    end

    def new 
        @product = Product.new
        @user = current_user
    end

    def create
        @product = Product.create(product_params)
        if @product.save
            redirect_to user_products_path
        else
            redirect_to root_path
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
        @product.destroy
        redirect_to user_products_path(current_user)
    end
 
    
    private
    def set_product
      @product = Product.find(params[:id])
    end


    def product_params
      params.require(:product).permit(:title, :price, :user_id)
    end

end
      
  

