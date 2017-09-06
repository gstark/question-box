class AnswersController < ApplicationController

  def create
    # Find the question first
    @question = Question.find(params[:question_id])

    # Build a new answer for that question
    @answer = @question.answers.new(answer_params)

    # Associate the current user to this answer
    @answer.user = current_user

    if @answer.save
      redirect_to @question, notice: "Answer created"
    else
      render 'questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end