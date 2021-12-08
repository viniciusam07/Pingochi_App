class PingochisController < ApplicationController

  def index
    @pingochis = Pingochi.all
    @user_pingochis = Pingochi.where(user: current_user)
    @friend_pingochis = Pingochi.where.not(user: current_user)

    if params[:query].present?
      @pingochis = @pingochis.where('name ILIKE ?', "%#{params[:query]}%")
    elsif params[:gender].present? && params[:gender] != ""
      @pingochis = @pingochis.where('gender ILIKE ?', "%#{params[:gender]}%")
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
    flash_alert_if_not_owner
    @items = Item.all
  end

  def show
    @pingochi = Pingochi.find(params[:id])
    @mating_count = Mating.where("pingochi1_id = :id or pingochi2_id = :id", id: @pingochi.id).where(mating_status: true).count
    flash_alert_if_not_owner
  end

  def slap
    @pingochi = Pingochi.find(params[:pingochi_id])
    @pingochi.slap
    redirect_to pingochi_path(@pingochi)
    flash[:notice] = 'Bitchslap!'
  end

  def fish
    @pingochi = Pingochi.find(params[:pingochi_id])
    @pingochi.fish
    redirect_to pingochi_path(@pingochi)
    flash[:notice] = 'Your Pingochi fished more fishcoins!!!!!!'
  end

  def feed
    @pingochi = Pingochi.find(params[:pingochi_id])
    if @pingochi.energy >= 100
      redirect_to pingochi_path(@pingochi)
      flash[:notice] = 'Your Pingochi health is full!'
    else
      @pingochi.feed
      redirect_to pingochi_path(@pingochi)
      flash[:notice] = 'That hit the spot! Energy: +20'
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
    flash[:notice] = "Your Pingochi needs special treatment!"
  end

  def strength
    @pingochi = Pingochi.find(params[:pingochi_id])
    if @pingochi.strength_skill >= 100
      redirect_to pingochi_path(@pingochi)
      flash[:notice] = 'Strength stats maxed out. Your Pingochi is the most powerful!'
    else
      @pingochi.strength
      redirect_to pingochi_path(@pingochi)
      flash[:notice] = 'Strength increased!'
    end
  end

  def inteligence
    @pingochi = Pingochi.find(params[:pingochi_id])
    if @pingochi.inteligence_skill >= 100
      redirect_to pingochi_path(@pingochi)
      flash[:notice] = 'Inteligence stats maxed out. Your Pingochi is a brainiac!'
    else
      @pingochi.inteligence
      redirect_to pingochi_path(@pingochi)
      flash[:notice] = 'Inteligence increased!'
    end
  end

  def speed
    @pingochi = Pingochi.find(params[:pingochi_id])
    if @pingochi.speed_skill >= 100
      redirect_to pingochi_path(@pingochi)
      flash[:notice] = 'Speed stats maxed out. Your Pingochi is a lighning bolt!'
    else
      @pingochi.speed
      redirect_to pingochi_path(@pingochi)
      flash[:notice] = 'Speed increased!'
    end
  end

  def opponents
    @pingochi = Pingochi.find(params[:pingochi_id])
    @opponent_pingochis = Pingochi.where.not(id: @pingochi.id)
  end

  def couples
    @pingochi = Pingochi.find(params[:pingochi_id])
    @couple_pingochis = Pingochi.where.not(id: @pingochi.id) && Pingochi.where.not(gender: @pingochi.gender)
  end

  private

  def pingochi_params
    params.require(:pingochi).permit(:name, :specie)
  end

  def flash_alert_if_not_owner
    unless user_is_owner?
      redirect_to pingochis_path, notice: "This pingochi is not yours!!"
    end
  end

  def user_is_owner?
    @pingochi.user == current_user
  end
end
