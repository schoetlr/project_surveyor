class AnswersController < ApplicationController

  def create
    
    question_count = params[:question_count].to_i
    (1..question_count).each do |index|
      question_id = params["question_#{index}_id"].to_i
      
      unless params["question_#{index}"].nil?
        option_id = params["question_#{index}"].to_i
      end

      answer = Answer.create(:question_id => question_id, option_id: option_id) 
      if answer.save
        #do nothing if answer is created since there are multiple answers
      else
        flash[:error] = "Please answer required questions."
        redirect_to :back and return
      end
    end

    redirect_to root_path

  end
end
