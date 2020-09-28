class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Coctail.find(params[params[:id]])
  end

  def new
  @cocktail = Coctail.new
  end

end
