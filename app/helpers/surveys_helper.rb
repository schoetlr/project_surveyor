module SurveysHelper

  def question_required?(question)
    if question.required
      "Question Required"
    end
  end
end
