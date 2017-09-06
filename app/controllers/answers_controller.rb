class AnswersController < ApplicationController

  def toggle
    # Find the question first
    @question = Question.find(params[:question_id])

    if @question.user != current_user
      redirect_to @question, alert: "You can't mark this answer correct since you didn't author this quesiton"
      return
    end

    # Find the answer
    @answer = @question.answers.find(params[:id])

    @answer.update_attributes(correct: !@answer.correct)

    redirect_to @question
    # redirect_to question_path(@question)
  end

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