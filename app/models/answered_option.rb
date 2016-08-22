class AnsweredOption < ActiveRecord::Base
  belongs_to :answer
  belongs_to :option
end
