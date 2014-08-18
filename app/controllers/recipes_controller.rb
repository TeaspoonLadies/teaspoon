class RecipesController < ApplicationController

def index
	@recipes = Recipe.all
end

def create
	@recipe = Recipe.new.conversion(recipe_params[:ingredients])
  @recipe.save
  recipe = Recipe.conversion(@recipe[:ingredients])
   # Recipe.new.conversion(@recipe[:ingredients])
  # @recipe = Recipe.new(recipe_params)
  # Recipe.conversion(@recipe[:ingredients])
  redirect_to '/'
end

private
	def recipe_params
		params.require(:recipe).permit(:name, :ingredients)
	end

end
