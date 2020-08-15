class PagesController < ApplicationController
  def home
  end

  def about
  end

  def new

  end

  def create
    render plain: params[:article]
  end
  
end