class DispatchingsController < ApplicationController
  before_action :require_user_logged_in
  include SessionHelper

  def new
    @chem = Chem.find(params[:chem_id])
    @dispatching = Dispatching.new
    
  end
  
  def create
    @chem = Chem.find(params[:chem_id])
    @dispatching = @chem.dispatchings.build(dispatching_params)
    
    if @dispatching.dispatching_number.nil?
     flash[:danger] = '出庫数を入力して下さい。'
     redirect_to new_chem_dispatching_path
     
    elsif @dispatching.dispatching_person.empty?
     flash[:danger] = '出庫者を入力して下さい。'
     redirect_to new_chem_dispatching_path
  
    elsif @dispatching.dispatching_number > (@chem.enterings.pluck(:entering_number).sum - @chem.dispatchings.pluck(:dispatching_number).sum)
      flash[:danger] = '在庫数より多い数量を出庫できません。'
      redirect_to new_chem_dispatching_path
      
    elsif @dispatching.save
      flash[:success] = '出庫に成功しました。'
      redirect_to current_user
    
    else
      flash[:danger] = '出庫に失敗しました。'
      redirect_to new_chem_dispatching_path
    end
  end
  


 private

  def dispatching_params
    params.require(:dispatching).permit(:dispatching_number, :dispatching_person)
  end
  
end
