
class ShoppingListsController < ApplicationController

	def index
		@shopping_lists = Shopping_List.all
	end

	def create
  	@shopping_list = Shopping_List.new(shopping_list_params)
  	@shopping_list.save
  	render 'index'
	end

	private
	def shopping_list_params
		params.require(:shopping_list).permit(:recipe_id, :content)
	end
end
