class CategoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.valid?
            @category.save
            redirect_to categories_path(@category)
            flash[:notice] = "New category added"
        else
            render :new
        end
    end

    def show
        @category= Category.find(params[:id])
        @tasks = @category.tasks.order(:name)
    end

    def edit 
        @category = Category.find(params[:id])
    end

    def update 
        @category = Category.find(params[:id])
        if @category.update(category_params)
            @category.save
            redirect_to categories_path
            flash[:notice] = "Category updated"
        else
            render :edit
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        flash[:alert] = "Category deleted"
        redirect_to categories_path
    end
    private

    def category_params
        params.require(:category).permit(:name, :description)
    end


end
