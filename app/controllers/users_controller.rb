class UsersController <ApplicationController
   before_action :set_user ,only: [:edit,:update,:show]
   before_action :require_same_user,only: [:edit,:update,:destroy]
   before_action :require_admin, only: [:destroy]
    def new 
    @user=User.new
    end
    def index
        @users=User.paginate(page: params[:page],per_page: 4)
    end
    def create
        @user=User.new(user_params)
        
        if @user.save
            session[:user_id]=@user.id
            flash[:success]="welcome to library #{@user.username}"
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end
    def edit
    end

    def update
        if @user.update(user_params)
            flash[:success]= "ur account has been updated"
            redirect_to books_path
        else
            render'edit'
        end
    end
    def show
        @user_books= @user.books.paginate(page: params[:page],per_page:1)
    end
    def destroy
        @user=User.find(params[:id])
        @user.destroy
        flash[:danger]="u delete ur user and all ur book has bropped down"
        redirect_to users_path
    end
    
    private
    def user_params
        params.require(:user).permit(:username,:email,:password)
    end
    def set_user
        @user=User.find(params[:id])
    end
    def require_same_user
        if current_user!= @user and !current_user.admin?
            flash[:danger]="u can update ur profile only"
            redirect_to root_path
        end
    end
    def require_admin
        if logged_in? and !current_user.admin?
            flash[:danger]="u are not allowed to make this action"
            redirect_to root_path
        end
    end
end 