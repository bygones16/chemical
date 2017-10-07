class SessionsController < ApplicationController
  def new
  end

  def create
    login_id = params[:session][:login_id]
    password = params[:session][:password]
    if login(login_id, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @user
    else
      flash[:danger] = 'ログインに失敗しました。'
      redirect_to root_path
    end
  end



  private

  def login(login_id, password)
    @user = User.find_by(login_id: login_id)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
