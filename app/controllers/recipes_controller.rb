class RecipesController < ApplicationController

def index
	@recipes = Recipe.all
end

def create
	@recipe = Recipe.conversion(recipe_params[:ingredients])
   @recipe.save
  # @recipe = Recipe.new(recipe_params)
  # Recipe.conversion(@recipe[:ingredients])
  redirect_to '/'
end

private
	def recipe_params
		params.require(:recipe).permit(:name, :ingredients)
	end

end
