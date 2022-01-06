class PageController < ApplicationController

    def first
    @article = Article.new(params[:id])
    
    end
    
    def second

    end
            
end
