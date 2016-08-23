class Answer < ActiveRecord::Base
  
  
  belongs_to :option

  belongs_to :question

  validates :question_id, presence: true

  validates :option_id, presence: true,
            if: :question_required?


  def question_required?
    id = self.question_id
    Question.find(id).required
  end

end
