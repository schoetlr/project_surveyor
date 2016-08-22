class QuestionsController < ApplicationController
  def set_up
    @survey = Survey.find(params[:survey_id])
  end

  def new
    @survey = Survey.find(params[:survey_id])
  end
end
