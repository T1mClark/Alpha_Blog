class ArticlesController < ApplicationController

  def show
  
    #Note: Make sure the variable is an instance variable (@) so it is
    #      available outside of the routine.
    
      @article = Article.find(params[:id])

  end
  
end