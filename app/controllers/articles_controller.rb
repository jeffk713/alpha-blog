class ArticlesController < ApplicationController
  def show
    debugger
    @article = Article.find(params[:id]) # instance variable is needed
  end
end