class ArticlesController < ApplicationController
    before_action :set_article , only: [:show,:edit,:update,:destroy]
def show    
end
def index
    @articles = Article.all
end
def new
    @article = Article.new
end
def edit
end
def create
    @article = Article.new(article_params)
    if @article.save 
    #redirect_to articles_path(@article)
    flash[:notice] = "Articles Was Succesfully Saved"
    redirect_to @article

    else 
        render 'new'
    end
end

def update
    
        if @article.update(params.require(:article).permit(:title,:description))
        flash[:notice] = "Article was updated successfully."
        redirect_to @article
    else
        render 'edit'
    end

end
def destroy
     
    @article.destroy # destroy the article
    redirect_to articles_path # redirect to the article list
  end
  private

  def set_article
    @article = Article.find(params[:id]) # find the article  
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end