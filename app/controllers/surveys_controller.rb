class SurveysController < ApplicationController
  
  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(whitelisted_params)
    if @survey.save
      flash[:success] = "Survey successfully created"
      #redirect to question set up(choose how many options, if required etc)
      redirect_to set_up_survey_questions_path(@survey)
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def show
    @survey = Survey.find(params[:id])
    @questions = @survey.questions
  end

  def index
  end

  def edit
  end

  private

  def whitelisted_params
    params.require(:survey).permit(:title, 
                                   :description)
  end
end
