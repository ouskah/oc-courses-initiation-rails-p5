class BooksController < ApplicationController

    def index
    
        @books = Book.all
    
    end


    def create
    
        Book.create title: params[:title]
        redirect_to "/books"
    
    end


    def show
    
        @book = Book.find(params[:id])
    
    end


    def update
        
       @book = Book.find(params[:id])
        if @book.update title: params[:title]
            
            flash[:success] = "Le livre à été mis à jour."
            
            redirect_to "/books/#{params[:id]}"
        else
           render "show"
        end
    end
    
    
    def destroy
    
        Book.find(params[:id]).destroy
        redirect_to "/books"
    
    end

end