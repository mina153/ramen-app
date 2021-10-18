class QuestionsController < ApplicationController
  def create
    question = Question.create(question_params)
    redirect_to event_path(question.event.id)
  end

  private
  def question_params
    params.require(:question).permit(:hatena).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
