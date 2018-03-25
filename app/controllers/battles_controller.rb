class BattlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :load_battle, except: [:index, :new, :create]
  before_action :owner, only: [:edit, :update, :destroy]

  def index
    @type = params[:type].downcase # "top" or "newest"
    @battles = Battle.send(@type)

    respond_to{|format| format.js}
  end

  def show
    @submission = Submission.new
  end

  def new
    @battle = current_user.battles.new
  end

  def create
    @battle = current_user.battles.build battle_params
    if @battle.valid?
      @battle.save
      flash[:success] = "Battle is successfully created!"
      redirect_to @battle
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @battle.update battle_params
      flash[:success] = "Battle is successfully updated!"
      redirect_back fallback_location: @battle
    else
      render "edit"
    end
  end

  def destroy
    if @battle.destroy
      flash[:success] = "Battle is successfully deleted!"
      redirect_to root_url
    else
      flash[:danger] = "There was an error when trying to delete the battle!"
      redirect_back fallback_location: root_url
    end
  end

  private

  def battle_params
    params.require(:battle).permit :title, :link, :description
  end

  def load_battle
    @battle = Battle.friendly.find params[:id]
  end

  # Filter: only owner can perform some certain actions
  def owner
    unless current_user == @battle.user
      flash[:danger] = "You're not authorized to perform this action!"
      redirect_back fallback_location: root_url
    end
  end
end
