class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
    if params[:query].present?
      @cocktails = Cocktail.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @cocktails = Cocktail.all
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
  @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save!
        redirect_to @cocktail
    else
        render :root
    end
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.update(coktail_params)
      redirect_to cocktail_path
    else
      render :edit
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.destroy
    redirect_to root_path
    end
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :photo)
  end

end
