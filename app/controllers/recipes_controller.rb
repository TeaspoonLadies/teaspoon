class RecipesController < ApplicationController

def index
	@recipes = Recipe.all
end

def create
  @recipe = Recipe.new(recipe_params)
  @recipe.save
  
  # @recipe = Recipe.new(:name => recipe_params[:name])
  # @recipe.conversion(recipe_params[:ingredients])
  # @recipt.save

   # Recipe.new.conversion(@recipe[:ingredients])
  # @recipe = Recipe.new(recipe_params)
  # Recipe.conversion(@recipe[:ingredients])
  # render partial: 'recipe'
  render 'index'
end

private
	def recipe_params
		params.require(:recipe).permit(:name, :ingredients)
	end

end
