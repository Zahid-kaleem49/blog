class ArticlesController < ActionController::Base
    before_action :find_article, only: [:show, :edit]
    def index
        @articles = Article.all
        puts "in index page 000000000000000000000000000000000"
    end
    
    def new
        @article = Article.new
        puts "in def new method 00000000000000000000000000000000000000000000000000"    

    end
    def create
       
        #render plain: params[:article].inspect
        @article = Article.new (article_params)
        if @article.save
            flash[:notice] = "Article was successfully saved"
            
            puts "in create method 000000000000000000000000000000000"
            redirect_to articles_path
                    else
            render "new"
        end
    end
    def show 
                
    end

    def edit
        puts "IN def edit method 00000000000000000000000000 "
    end
    def update

        puts "in def update method 000000000000000000000000000"
        @article = Article.new(article_params)
        if @article.save
            redirect_to new_article_path
        
        else
            render "edit"
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
        puts "in article params method 000000000000000000000000000000000"
        params.require(:article).permit(:title,:description)
    end
    
end