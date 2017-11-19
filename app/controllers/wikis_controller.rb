class WikisController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.description = params[:wiki][:description]
    @wiki.director = params[:wiki][:director]
    @wiki.year = params[:wiki][:year]
    @wiki.private = params[:wiki][:private]
    @wiki.user_id = params[:wiki][:user_id]
    
    if @wiki.save
      flash[:notice] = "Wiki was saved!"
      redirect_to(@wiki)
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render(:new)
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    
    if @wiki.save
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
    params.require(:wiki).permit(:title, :description, :director, :year, :private, :user_id)
  end
end
