class SeccionsController < ApplicationController

def new 

end 

def create
    user=User.find_by(email:params[:seccion][:email].downcase)
    if user && user.authenticate(params[:seccion][:password])
        session[:user_id]= user.id
        flash[:success]="ur are loged in "
        redirect_to users_path(user)
    else
        flash.now[:danger]="there is something wronge with ur data"
        render 'new'
    end
end
def destroy

end
end