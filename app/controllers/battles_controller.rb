class BattlesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :battle_params, only: [:create, :update]

  def show
    @battle = Battle.friendly.find params[:id]
  end

  def new
    @battle = current_user.battles.new
  end

  def create
    @battle = current_user.battles.build battle_params
    if @battle.valid?
      @battle.save
      flash[:success] = "Battle is successfully created!"
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  private

  def battle_params
    params.require(:battle).permit :title, :link, :description
  end
end
