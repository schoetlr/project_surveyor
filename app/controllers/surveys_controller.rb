class SurveysController < ApplicationController
  
  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(whitelisted_params)
    if @survey.save
      flash[:success] = "Survey successfully created"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def show
    @survey = Survey.find(params[:id])
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
