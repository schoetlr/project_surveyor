class QuestionsController < ApplicationController
  def set_up
    @survey = Survey.find(params[:survey_id])
  end

  def new
    @survey = Survey.find(params[:survey_id])
    required = to_bool(params[:required])
    @question = Question.new(survey_id: params[:survey_id], 
                             required: required,
                             answer_count: params[:answer_count])
    params[:option_count].to_i.times {@question.options.build}
  end

  def create
    @survey = Survey.find(params[:survey_id])
    @question = Question.new(whitelisted_params)
    if @question.save
      flash[:success] = "Question successfully saved"
      redirect_to survey_questions_path(@survey)
    else
      flash[:error] = "Something went wrong"
      render :new
    end

  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:success] = "Question successfully destroyed"
      redirect_to survey_path(params[:survey_id])
    else
      flash[:error] = "Something went wrong"
      redirect_to :back
    end
  end

  def index
    @survey = Survey.find(params[:survey_id])
    @questions = @survey.questions
  end


  private

  def whitelisted_params
    params.require(:question).permit(:survey_id,
                                     :required,
                                     :answer_count,
                                     :query,
                                     { :options_attributes => [
                                      :text,
                                      :_destroy ]})
  end
end
