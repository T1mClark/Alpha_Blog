class ArticlesController < ApplicationController

  def show
  
    #Note: Make sure the variable is an instance variable (@) so it is
    #      available outside of the routine.
    
      @article = Article.find(params[:id])

  end

  def index
    #
    #Assign the instance variable (@articles) a hash of all of the articles.
   
    @articles = Article.all
    
  end
  
  def new

  end

  def create
    render plain: params[:article]
  end
  
end