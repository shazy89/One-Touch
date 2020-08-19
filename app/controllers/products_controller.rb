class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    before_action :actrive_user, only: [:index, :new, :create ]

    def index
        
        if params[:term]
           @products = @user.products.search(params[:term])
        else
            @products = @user.products.sorted_title
        end
    end
       
    def new 
        @product = Product.new
    end
  
    def create
        @product = @user.products.build(product_params)
        if @product.save
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
        @product.destroy
        redirect_to user_products_path(@user)
    end
 
    private
    def set_product
      @product = Product.find(params[:id])
    end


    def product_params
      params.require(:product).permit(:title, :price, :user_id)
    end

    def actrive_user
        @user = current_user
    end

end



    
  



      
  

