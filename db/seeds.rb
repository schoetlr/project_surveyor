# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Survey.destroy_all
Question.destroy_all
Option.destroy_all


3.times do 
  Survey.create(title: Faker::Commerce.department, description: Faker::Company.catch_phrase)
end

def question_params(survey_id)
  {
    :survey_id => survey_id,
    :required => [true, false].sample,
    :query => Faker::Hipster.sentence,
    :answer_count => ["single", "multiple"].sample
  }
end


Survey.all.each do |survey|
  3.times do 
    Question.create(question_params(survey.id))
  end
end


Question.all.each do |question|
    4.times do
      Option.create(:text => Faker::StarWars.quote, question_id: question.id)
    end
  
end

##survey without questions

Survey.create(title: Faker::Commerce.department, description: Faker::Company.catch_phrase)