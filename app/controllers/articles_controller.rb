class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id]) # instance variable is needed
  end

  def new
    @article = Article.new # for initial render of the page
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description)) # Rails will take title and description from the article 
    if @article.save
      flash[:notice] = "Article has been created successfully"
      redirect_to @article # short-cut for 'redirect_to article_path(@article)'
    else
      render 'new'
    end
  end
end
