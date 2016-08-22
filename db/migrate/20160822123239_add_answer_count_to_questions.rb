class AddAnswerCountToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :answer_count, :string, default: "single", null: false
  end
end
