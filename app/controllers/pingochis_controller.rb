class PingochisController < ApplicationController

  def index
    @pingochis = Pingochi.all
    @user_pingochis = Pingochi.where(user: current_user)
    @friend_pingochis = Pingochi.where.not(user: current_user)

    if params[:query].present?
      @pingochis = @pingochis.where('name ILIKE ?', "%#{params[:query]}%")
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'shared/pingochi_list.html', locals: { pingochis: @pingochis } }
    end
  end

  def new
    @pingochi = Pingochi.new
  end

  def create
    @pingochi = Pingochi.new(pingochi_params)
    @pingochi.gender = ["male", "female"].sample
    @pingochi.user = current_user
    if @pingochi.save
      respond_to do |format|
        format.html { redirect_to pingochi_path(@pingochi) }
        format.js   { render :js => init_sweetalert('#load-pingochi') }
      end
    else
      render 'new'
    end
  end

  def edit
    @pingochi = Pingochi.find(params[:id])
    @items = Item.all
  end

  def show
    @pingochi = Pingochi.find(params[:id])
  end

  def slap
    @pingochi = Pingochi.find(params[:pingochi_id])
    @pingochi.slap
    redirect_to pingochi_path(@pingochi)
    flash[:notice] = 'Toma essa'
  end

  def fish
    @pingochi = Pingochi.find(params[:pingochi_id])
    @pingochi.fish
    redirect_to pingochi_path(@pingochi)
    flash[:notice] = 'Your Pingochi just fish more fishcoins!!!'
  end

  def feed
    @pingochi = Pingochi.find(params[:pingochi_id])
    if @pingochi.energy >=100
      redirect_to pingochi_path(@pingochi)
      flash[:notice] = 'Your Pingochi is already fed!'
    else
      @pingochi.feed
      redirect_to pingochi_path(@pingochi)
      flash[:notice] = 'Alimentado! Energia: +20'
    end
  end

  def sleep
    @pingochi = Pingochi.find(params[:pingochi_id])
    @pingochi.sleep
    redirect_to pingochi_path(@pingochi)
    flash[:notice] = 'ZZzZzZzZzZz'
  end

  def uti
    @pingochi = Pingochi.find(params[:id])
    @pingochi.uti
    redirect_to pingochi_path(@pingochi)
    flash[:notice] = "Seu Pingochi chegou no limite e precisa de atendimento especial"
  end

  private

  def pingochi_params
    params.require(:pingochi).permit(:name, :specie)
  end
end
