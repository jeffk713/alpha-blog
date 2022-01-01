class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 4)
  end

  def show
  end

  def new
    @article = Article.new # for initial render of the page
  end

  def edit
  end

  def create
    @article = Article.new(article_params) # Rails will take title and description from the article 
    @article.user = User.find(session[:user_id])
    
    if @article.save
      flash[:notice] = "Article has been created successfully"
      redirect_to @article # short-cut for 'redirect_to article_path(@article)'
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article has been updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id]) # instance variable is needed
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
