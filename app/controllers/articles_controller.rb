class ArticlesController < ApplicationController
  # Performs the specified method at the beginning of execution of each of
  # the specified methods.
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  
    #Note: Make sure the variable is an instance variable (@) so it is
    #      available outside of the routine.
    
    #@article = Article.find(params[:id])
    

  end

  def index
    # Assign the instance variable (@articles) a hash of all of the articles.
   
    @articles = Article.all
    
  end
  
  def new
    # Creates the instance variable @article so we do not generate an
    # "does not exist" error on other actions.
    @article = Article.new
  end

  def edit
    # We need to identify the correct article to pass.
  
    # @article = Article.find(params[:id])

  end

  def update
    # We need to identify and point to the correct article to pass. 
    #@article = Article.find(params[:id])
   
    # After selecting update, whitelisting the fields, we report back.  if we
    # encounter an error, return and refresh and display the error.
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      # Reloads the edit page.  This will also display the errors since the
      # update was unsuccessful.
      render 'edit'
    end
  end

  def destroy
    # We need to identify and point to the correct article to pass. 

    @article.destroy
    redirect_to articles_path
  end

  def create
    #Use:  render plain: params[:article]  to preview passed params.

    # We need to whitelist the fields we will be adding to the database:
    @article = Article.new(article_params)
    
    # Actually save the article to the DB. If successful, display message.
    if  @article.save
      flash[:notice] = "Article was created successfully."

      #render plain: @article.inspect

      # The following redirects the user to the main articles page.
      # Action: Redirect_to article_path(@article)

      #or better yet:
      redirect_to @article
   else
     render 'new'
   end

  end

  private

  # DRY: Don't Repeat Yourself:
  # We are going to replace methods that are repeatedly used in our code
  # with a single private method.
  
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end