class EnteringsController < ApplicationController
  before_action :require_user_logged_in
  include SessionHelper

  def new
    @chem = Chem.find(params[:chem_id])
    @entering = Entering.new
    
  end
  
  def create
    @chem = Chem.find(params[:chem_id])
    @entering = @chem.enterings.build(entering_params)

    if @entering.save
      flash[:success] = '入庫に成功しました。'
      redirect_to current_user
    else
      flash[:danger] = '入庫に失敗しました。'
      redirect_to current_user
    end
  end
  


 private
  def entering_params
    params.require(:entering).permit(:entering_number, :entering_person)
  end
  
end
