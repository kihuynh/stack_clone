class QuestionsController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user = self.current_user
    if @question.save
      flash[:notice] = "Question successfully created."
      redirect_to questions_path
    else
      flash[:alert] = "Question creation unsuccessful."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question successfully updated."
      redirect_to questions_path
    else
      flash[:alert] = "Question update unsuccessful."
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question successfully deleted."
    redirect_to questions_path
  end


private
  def question_params
    params.require(:question).permit(:question)
  end
end
