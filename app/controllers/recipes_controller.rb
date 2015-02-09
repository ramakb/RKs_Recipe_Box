class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "Successfully created the new Recipe"
    else
      render 'new'
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    redirect_to root_path, notice: "Successfully deleted the Recipe"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def recipe_params
    params.require(:recipe).permit(:title, :description, :user_id, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
  end
end