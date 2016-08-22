class AnswersController < ApplicationController

  def create
    question_count = params[:question_count].to_i
    (1..question_count).each do |index|
      question_id = params["question_#{index}_id"].to_i
      option_id = params["question_#{index}"].to_i
      
      Answer.create(:question_id => question_id, option_id: option_id) 
    end

    redirect_to root_path

  end
end
