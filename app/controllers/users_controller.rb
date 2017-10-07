class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @q = @user.chems.search(params[:q])
    @chems = @q.result(distinct: true)
  end

  def new
    @user = User.new
  end
  
  def create
     @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
    
  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  
  private

  def user_params
    params.require(:user).permit(:company_name, :login_id, :password, :password_confirmation)
  end
  


end
