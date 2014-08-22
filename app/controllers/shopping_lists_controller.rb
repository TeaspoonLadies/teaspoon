class ShoppingListsController < ApplicationController

	def index
		@shopping_lists = ShoppingList.all
	end

	def create
  	@shopping_list = ShoppingList.new(shopping_list_params)
  	@shopping_list.save
  	redirect_to recipe_shopping_lists_path(@shopping_list.recipe)
	end

	def new
		@recipe = Recipe.find(params[:recipe_id])
		@shopping_list = ShoppingList.new
	end

	private
	def shopping_list_params
		params.require(:shopping_list).permit(:recipe_id, :content)
	end
end
