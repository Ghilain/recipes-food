class RecipeFoodsController < ApplicationController
  #  before_action :set_recipe_food
  skip_before_action :verify_authenticity_token
  # Show all data:
  # /recipe_foods or /recipe_foods.json
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
  end

  # Show data according id:
  # /1 or /1.json
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.find(params[:id])
  end

  # New recipe food by /new
  def new
    @recipe_food = RecipeFood.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  # Edit recipe food according to it it
  # /1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Create new recipe food:
  # /recipe_foods or /recipe_foods.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_url(@recipe.id), notice: 'Recipe food created successfully.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # Delete recipe food by it id
  # /1 or /1.json
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipes_path, notice: 'Recipe food destroyed .' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
