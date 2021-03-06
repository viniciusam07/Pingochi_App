class MatingsController < ApplicationController

  def new
    @pingochi1 = Pingochi.find(params[:pingochi_id])
    @pingochi2 = Pingochi.find(params[:couple_id])
    @mating = Mating.new
  end

  def create
    @pingochi1 = Pingochi.find(params[:pingochi_id])
    @pingochi2 = Pingochi.find(params[:couple_id])
    mating_status = mating_process(@pingochi1, @pingochi2)
    @mating = Mating.new(pingochi1: @pingochi1, pingochi2: @pingochi2, mating_status: mating_status)
    if @mating.save!
      redirect_to pingochi_couple_mating_path(params[:pingochi_id], params[:couple_id], @mating)
    else
      render 'new'
    end
  end

  def show
    @pingochi1 = Pingochi.find(params[:pingochi_id])
    @pingochi2 = Pingochi.find(params[:couple_id])
    @mating = Mating.find(params[:id])
  end

  def mating_process(pingochi1, pingochi2)
    @pingochi1_xp = pingochi1.strength_skill + pingochi1.speed_skill + pingochi1.inteligence_skill
    @pingochi2_xp = pingochi2.strength_skill + pingochi2.speed_skill + pingochi2.inteligence_skill
    @couple_xp = @pingochi1_xp + @pingochi2_xp
    if @couple_xp > 10
      @mating_status = true
    else
      @mating_status = false
    end
  end
end
