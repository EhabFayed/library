class BooksController < ApplicationController
    #new handeled by creat action
    def new 
        @book=Book.new
    end
    #handeld by update action 
    def edit 
        @book=Book.find(params[:id])
    
    end
    def index 
        @books=Book.all

    end
    
    def update
        @book=Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] ="book data has been updated"
            redirect_to book_path(@book)
        else
            render'edit'
        end
    end
    def create 
        #render plain: params[:book]. inspect
        #@book.save
        #show article after creation
        #redirect_to books_path(@book)
        @book=Book.new(book_params)
        if @book.save 
            flash[:notice] ="book has been added successfully"
            redirect_to book_path(@book)
        else 
            render 'new'
        end
    end
    def show 
        @book=Book.find(params[:id])
        
    end
    def destroy
        @book=Book.find(params[:id])
        @book.destroy
        flash[:notice]="book has been deleted"
        redirect_to books_path
    
    end
    
    private 
    def book_params
        params.require(:book).permit(:book, :author, :description)
        
    end
end
