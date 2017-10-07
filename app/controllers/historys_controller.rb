class HistorysController < ApplicationController
  def show
    @chem = Chem.find(params[:id])
    @entering = @chem.enterings.all
    @dispatching = @chem.dispatchings.all
    
  end
end
