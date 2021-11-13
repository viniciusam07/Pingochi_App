class PingochisController < ApplicationController

  def new
    @pingochi = Pingochi.new
  end

  def create
    @pingochi = Pingochi.new(pingochi_params)
    @pingochi.gender = ["male", "female"].sample
    @pingochi.user = current_user
    if @pingochi.save
      redirect_to pingochi_path(@pingochi)
    else
      render 'new'
    end
  end

  def slap
    @pingochi = Pingochi.find(params[:id])
    @pingochi.slap
    redirect_to pingochi_path(@pingochi)
    flash[:notice] = 'Toma essa'
    # o alerta da ação será com JS
  end

  def sleep
    @pingochi = Pingochi.find(params[:id])
    @pingochi.sleep
    redirect_to pingochi_path(@pingochi)
    flash[:notice] = 'ZZzZzZzZzZz'
    # o alerta da ação será com JS
  end


  private

  def pingochi_params
    params.require(:pingochi).permit(:name)
  end
end
