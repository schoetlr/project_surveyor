class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :options
  validates :answer_count, inclusion: ["single", "multiple"]

  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
end
