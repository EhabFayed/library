class BooksController < ApplicationController
    before_action :set_book ,only: [:edit,:update,:show,:destroy]
    before_action :require_user,exept:[:show,:index]
    before_action :require_same_user,only: [:edit,:update,:destroy]
    #new handeled by creat action
    def new 
        @book=Book.new
    end
    #handeld by update action 
    def edit 
    end
    def index 
        @books=Book.paginate(page: params[:page],per_page: 2)

    end
    
    def update
        if @book.update(book_params)
            flash[:success] ="book data has been updated"
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
        @book.user= current_user
        if @book.save 
            flash[:success] ="book has been added successfully"
            redirect_to book_path(@book)
        else 
            render 'new'
        end
    end
    def show
    end
    def destroy
        @book.destroy
        flash[:danger]="book has been deleted"
        redirect_to books_path
    
    end
    
    private 
    def book_params
        params.require(:book).permit(:book, :author, :description)
        
    end
    def set_book
        @book=Book.find(params[:id])
    end
    def require_same_user
        if current_user!= @book.user
            flash[:danger]="u must be the user how donate this book t our liberary to update or take it again "
            redirect_to root_path
        end
    end
end
