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
        @product = current_user.products.build(product_params)
        if @product.save
            redirect_to products_path
        else
            redirect_to root_path
        end
    end
        
    def show
    end
        

    def edit
    end

    def update
          # binding.pry
        if  @product.update(product_params)
            redirect_to products_path
        else
            redirect_to root_path
        end
    end

    def destroy
        @product.destroy
        redirect_to products_path
    end
    
    private
    def set_product
      @product = Product.find(params[:id])
    end


    def product_params
      params.require(:product).permit(:title, :price)
    end

end
      
  

