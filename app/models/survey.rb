class Survey < ActiveRecord::Base

  validates :title, :description, presence: true
end
