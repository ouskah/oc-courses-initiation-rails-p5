class BooksController < ApplicationController

    def index
    
        @books = Book.all
        @book = Book.new
    
    end


    def create
    
        @book = Book.new title: params[:title]
        
        if @book.save
            flash[:success] = "Le livre a bien été créé."
            redirect_to "/books"
        else
            @books = Book.all
            render "index"
        end
    
    
        # Book.create title: params[:title]
        # redirect_to "/books"
    
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