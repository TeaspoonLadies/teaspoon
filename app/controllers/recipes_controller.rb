class RecipesController < ApplicationController

def index
	@recipes = Recipe.all
end

def new
  @recipe = Recipe.new
end

def create
  @recipe = Recipe.new(recipe_params)
  @recipe.save
  respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'recipe was successfully created.' }
        format.json { render action: 'show', status: :created, location: @recipe }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  # render 'index'
end

def show
  @recipe = Recipe.find(params[:id])
end

private
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

	def recipe_params
		params.require(:recipe).permit(:name, :ingredients, :shopping_list_ids => [], :shopping_lists_attributes => [:recipe_id, :content])
	end

end
