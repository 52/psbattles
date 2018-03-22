class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_object
  before_action :not_owner

  def create
    @object.liked_by current_user

    respond_to{|format| format.js}
  end

  def destroy
    @object.unliked_by current_user

    respond_to{|format| format.js}
  end

  private

  def load_object
    if params[:type] == "battle"
      # load battle
      @object = Battle.find params[:object_id]
    else
      # load submission
      @object = Submission.find params[:object_id]
    end
  end

  # Filter: users can't like their own battles or submissions
  def not_owner
    redirect_back fallback_location: root_url if current_user.id == @object.user_id
  end
end
