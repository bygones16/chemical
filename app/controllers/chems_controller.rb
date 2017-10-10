class ChemsController < ApplicationController
  before_action :require_user_logged_in
  include SessionHelper
  
  def new
    @chem = Chem.new
  end
  
  def create
    @chem = current_user.chems.build(chem_params)
    if @chem.save
      flash[:success] = '品名を登録しました。'
      redirect_to current_user
    else
      flash.now[:danger] = '品名の登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @chem = Chem.find(params[:id])
  end
  
  def destroy
    @chem = Chem.find(params[:id])
    @chem.destroy
    flash[:success] = @chem.chemical_name + 'を削除しました。'
    redirect_to current_user
  end
  
 private

  def chem_params
    params.require(:chem).permit(:chemical_name)
  end
  
end
