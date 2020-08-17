class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
        @product = Product.all
    end

    def new 
        @product = Product.new
    end

    def create
        @product = Product.create(product_params)
        if @product.save
            redirect_to new_product_path
        else
            redirect_to root_path
        end
    end

    def show
    end
        

    def edit
    end

    def update
        @product = Product.update(product_params)
        if @product.save
            redirect_to new_product_path
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
      @recipt = Recipt.find(params[:id])
    end


    def product_params
      params.require(:recipt).permit(:title, :price)
    end

end
