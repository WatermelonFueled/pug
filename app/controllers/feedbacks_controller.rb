class FeedbacksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @feedback = current_user.sent_feedbacks.build(feedback_params)
    if @feedback.save
      redirect_to root_url
    else
      render 'static_pages/home'
  end

  def destroy
  end

  private
    def feedback_params
      params.require(:feedback).permit(:rating, :comment, :recipient_id)
    end
end
