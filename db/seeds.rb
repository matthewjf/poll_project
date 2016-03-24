# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  u = User.create!(user_name: Faker::Superhero.name)

  (rand(5) + 1).times do
    poll = Poll.create!(author_id: u.id, title: Faker::Name.title )

    (rand(4) + 1).times do
      q = Question.create!(poll_id: poll.id, text: Faker::Lorem.sentence )

      4.times do
        ac = AnswerChoice.create!(question_id: q.id, text: Faker::Lorem.sentence)

      end
    end
  end
end

User.all.each do |user|
  Poll.all.each do |poll|
    if rand(2) == 1 && poll.author != user
      poll.questions.all.each do |question|
        answer_id = question.answer_choices.sample.id
        Response.create!(answer_choice_id: answer_id, user_id: user.id)
      end
    end
  end
end
