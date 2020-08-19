class TablesController < ApplicationController
    before_action :set_table, only: [:show, :edit, :update, :destroy, :clearthetable]
    before_action :user, only: [:index, :new, :show]
    
    def index
       
       @table = Table.all
    end

    def new 
        @table = Table.new
     
    end

    def create
        @table = current_user.tables.build(table_params)
        if @table.save
            redirect_to tables_path
        else
            redirect_to root_path
        end
    end

    def show
        @product = Product.all
    end
        
    def edit
    end

    def update
        if  @table.update(table_params)
            redirect_to table_path(@table)
        else
            redirect_to root_path
        end
    end

    def destroy
        @table.destroy
        redirect_to root_path
    end
    
    def clearthetable 
        if @table.select_items.present?
         @table.select_items.destroy_all 
         redirect_to table_path(@table)
        else
        redirect_to table_path(@table)
      end
    end
      
    
    private
   
    def set_table
      @table = Table.find(params[:id])
    end
   
   
    def table_params
      params.require(:table).permit(:tabel_num)
    end
   
    def user 
       @user = current_user 
    end
   
   
   end
      





