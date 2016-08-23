class Survey < ActiveRecord::Base
  has_many :questions
  
  validates :title, :description, presence: true

  def response_count
    question = self.questions.where(required: true).first

    question.nil? ? 0 : question.answers.size
  end
end
