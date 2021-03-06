class ArticlesController < ApplicationController
  before_action :find_article, only: [:show , :edit]
  before_action :require_user,  except: [:show, :index]
  before_action :require_same_user, only: [:edit,:update,:destroy ]
  def index
    @articles = Article.all
    puts 'in index page 000000000000000000000000000000000'
  end

  def new
    puts '==============================================='
    @article = Article.new

    @user_id = params[:user_id] || current_user.id
    puts 'in def new method 00000000000000000000000000000000000000000000000000'
  end

  def create
    # debugger
    # render plain: params[:article].inspect
    puts 'in create method 00000000000000000000000'
    @article = Article.new(article_params)
    # @article.user = User.first

    if @article.save
      flash[:notice] = 'Article was successfully saved'

      redirect_to article_path(@article.id)
    else

      @user_id = params[:article][:user_id]
      puts 'ffffffffffffffffffffffffffffffffffffffffffffffffffff'
      puts @user_id.inspect

      render 'new'
    end
  end

  def show
   
  end

  def edit
    puts 'IN def edit method 00000000000000000000000000 '
    @article = Article.find(params[:id])
  end

  def update
    puts 'in def update method 000000000000000000000000000'
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to new_article_path
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    puts 'in article params method 000000000000000000000000000000000'
    params.require(:article).permit(:title, :description, :user_id)
  end

  def require_same_user
    if current_user != @article.user
      flash.notice = "You can only edit your own articles"
      redirect_to articles_path

    end
  end
end
