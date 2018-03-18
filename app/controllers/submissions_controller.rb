class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_battle,     only: [:edit, :update, :destroy, :create]
  before_action :load_submission, only: [:edit, :update, :destroy]
  before_action :owner,           only: [:edit, :update, :destroy]

  def create
    @submission = current_user.submissions.build submission_params
    @submission.battle_id = @battle.id
    @submission.save

    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    @submission.update submission_params

    respond_to do |format|
      format.js do
        render :edit unless @submission.valid?
      end
    end
  end

  def destroy
    @submission.destroy
    flash[:success] = "Your submission is successfully deleted!"
    redirect_back fallback_location: @battle
  end

  private

  def submission_params
    params.require(:submission).permit :link, :title, :description
  end

  def load_battle
    @battle = Battle.friendly.find params[:battle_id]
  end

  def load_submission
    @submission = @battle.submissions.find params[:id]
  end

  # Filter: only owner can perform some certain actions
  def owner
    unless current_user == @submission.user
      flash[:danger] = "You're not authorized to perform this action!"
      redirect_back fallback_location: root_url
    end
  end
end
