class ShoppingListsController < ApplicationController

	def index
		@shopping_lists = ShoppingList.all
	end

	def new
		@recipe = Recipe.find(params[:recipe_id])
		@shopping_list = ShoppingList.new
	end

	def create
  	@shopping_list = ShoppingList.new(shopping_list_params)
  	@shopping_list.save
  	
  	respond_to do |format|
      if @shopping_list.save
        format.html { redirect_to recipe_shopping_lists_path(@shopping_list.recipe), notice: 'Shopping List was successfully created.' }
        format.json { render action: 'show', status: :created, location: @shopping_list }
      else
        format.html { render action: 'new' }
        format.json { render json: @shopping_list.errors, status: :unprocessable_entity }
      end
    end
	end

	def show
		@recipe = Recipe.find(params[:recipe_id])
		@shopping_list = ShoppingList.find(params[:id])
	end

	private
	def set_shopping_list
		@shopping_list = ShoppingList.find(params[:id])
	end

	def shopping_list_params
		params.require(:shopping_list).permit(:recipe_id, :content)
	end
end
