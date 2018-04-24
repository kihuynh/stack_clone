class ResponsesController < ApplicationController

  def show
    @question = Question.find(params[:question_id])
    @response = Response.find(params[:id])
  end

  def new
    @question = Question.find(params[:question_id])
    @response = Response.new
  end

  def create
    @question = Question.find(params[:question_id])
    @response = Response.new(response_params)
    @response.question_id = @question.id
    @response.user_id = self.current_user.id

    if @response.save
      flash[:notice] = "You responded"
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @response = Response.find(params[:id])
    @response.destroy
    flash[:notice] = "Response destroyed"
    redirect_to question_path(@question)
  end

private
  def response_params
    params.require(:response).permit(:response)
  end
end
