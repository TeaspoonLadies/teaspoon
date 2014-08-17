class RecipesController < ApplicationController

def index
	@recipes = Recipe.all
end

def create
	@recipe = Recipe.new
end

private
	def recipe_params
		params.require(:rec)
	end

end
