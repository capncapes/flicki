class WikisController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
    unless @wiki.private == false || current_user == @wiki.user
      flash[:alert] = "You don't have access to that Flicki!"
      redirect_to edit_user_registration_path(session[:user])
    end
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = current_user.wikis.new(wiki_params)
    
    if @wiki.save
      flash[:notice] = "Flicki was saved!"
      redirect_to(@wiki)
    else
      flash.now[:alert] = "There was an error saving the Flicki. Please try again."
      render(:new)
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Flicki was updated."
      redirect_to(@wiki)
    else
      flash.now[:alert] = "There was an error saving the Flicki. Please try again."
      render(:edit)
    end
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to(action: "index")
    else
      flash.now[:alert] = "There was an error deleting the Flicki."
      render(:show)
    end
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :description, :director, :year, :private)
  end
end
