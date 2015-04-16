class UsersController < ApplicationController 
  
  def show
    @user = User.find(params[:id])
    
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    #if-else here allows handling of cases of failure/success based on value of @user.save
    if @user.save #if @user.save is true
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private #Ruby's private keyword
    #below code returns a version of params hash with only permitted attributes
    def user_params
      params.require(:user).permit(:name, :email, :password, 
                                  :password_confirmation)
    end
    
  
end
