class RecipesController < ApplicationController

def index
	@recipes = Recipe.all
end

def create
  @recipe = Recipe.new(recipe_params)
  # binding.pry
  @recipe.save
  # @recipe = Recipe.new(:name => recipe_params[:name])
  # @recipe.conversion(recipe_params[:ingredients])
  # @recipt.save
  # render partial: 'recipe'
  render 'index'
end

def show
  @recipe = Recipe.find(params[:id])
end

private
	def recipe_params
		params.require(:recipe).permit(:name, :ingredients)
	end

end
