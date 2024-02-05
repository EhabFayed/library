class UsersController <ApplicationController
    def new 
    @user=User.new
    end
    def index
        @users=User.paginate(page: params[:page],per_page: 4)
    end
    def create
        @user=User.new(user_params)
        
        if @user.save
            flash[:success]="welcome to library #{@user.username}"
            redirect_to books_path
        else
            render 'new'
        end
    end
    def edit
        @user=User.find(params[:id])
    end

    def update
        @user=User.find(params[:id])
        if @user.update(user_params)
            flash[:success]= "ur account has been updated"
            redirect_to books_path
        else
            render'edit'
        end
    end
    def show
        @user=User.find(params[:id])
        @user_books= @user.books.paginate(page: params[:page],per_page:1)
    end

    private
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end
end 