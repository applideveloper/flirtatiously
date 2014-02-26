#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)





(1..5).each do |i|
  test_unit = User.new({username: "#{["StudMuffin#{i}",
"GirlNextDoor#{i}", "BigBoi#{i}"].sample}",
  password: "password"})
  test_unit.save!
require File.dirname(__FILE__) + '/../config/initializers/constants'

  test_unit.build_user_filter.save!

  test_profile = Profile.new({
    user_id: test_unit.id,
    birthday: "#{2014-18-i}-12-01",
    sexual_orientation: rand(0..3),
      zip_code: [10003, 33071,
        11204, 11206, 10023,
        10001, 33063, 12518, 14604].sample,
      body_type: rand(0..4),
      smokes: rand(0..3),
      drugs: rand(0..3),
      religion: rand(0..6),
      likes: "#{["I love everything!",
      "To hang and have a great time",
      "Anything not big corporations!",
      "Nothing because I am a huge pessimist"].sample}",
      description: "#{["I used to be a tomboy when I was little. Looked and dressed like a boy. But I look like a girl now :)",
      "I walk fast, and with a purpose. However, I'm typically not a very serious person, and have been told I have a contagious laugh. I often times find myself cracking awkward jokes or making light of a heavy situation.",
      "Moved to New York a few years ago from the faraway land of Pennsylvania and currently loving BK. Looking forward to some roof top sunsets and beer garden adventures as the weather gets warmer. As for the cold, I find myself attached to the oven, popping out baked goods left and right or crock pot creations.",
      "I moved from Wisconsin to New York to experience the big city for myself. I love it, and I'm constantly on the lookout for new, exciting things to do. My favorite thing to do is explore different neighborhoods and discover each one's personality."].sample}"
  })


  if test_unit.username.include?("Girl")
    test_profile.sex = "F"
  else
    test_profile.sex = "M"
  end

  test_profile.save!

end



["Are you a loser?",
"Are you crazy",
"Do you have another lover?",
"Will you break my heart?",
"Do you have a social media addiction?",
"Are you beautiful?",
"Will you hate my snoring?",
"Would you say you have bad personal hygiene?",
"Do you have low self esteem?",
"Do you moisturize your hands?",
"Are you obsessed with Reddit karma points?"].each do |question_text|

  q = Question.create({text: question_text})
  AnswerChoice.create([
    {question_id: q.id,
     text: "Extremely"},
    {question_id: q.id,
      text: "A little bit"},
    {question_id: q.id,
      text: "No"},
    {question_id: q.id,
      text: "Not by choice"}
      ])


  User.pluck(:id).each do |user_id|

    answer_choice_ids = q
        .answer_choices
        .pluck(:id)

    Response.create!({
      answer_choice_id: answer_choice_ids.sample,
      question_id: q.id,
      user_id: user_id
    })

    question_importance =
      [0,1,10,50,250].sample

    num_acceptables =
      rand(1..answer_choice_ids.length-1)

    num_acceptables.times do
      AcceptableResponse.create!({
        answer_choice_id:
        answer_choice_ids.pop,
        importance: question_importance,
        question_id: q.id,
        user_id: user_id
      })
    end

  end

  end


  demo = User.create({username: "classygent69", password: "password"})

  test_profile = Profile.create({
    user_id: demo.id,
    sex: "Yes",
    sexual_orientation: "Straight",
      birthday: "1989-12-07",
      zip_code: 10003,
      body_type: "Schwarzenegger",
      smokes: "Not cigarettes",
      drinks: "Desperately",
      drugs: "They solve all my problems.",
      religion: "Atheist",
      sign: "Sagittarius",
      education: "Graduate school",
      offspring: "Might have kids he does not know about",
      pets: "Cats",
      likes: "Not receiving sunlight while at App Academy",
      description: "I made this site, so you should date me or hire me!"
  })

  demo.build_user_filter.save!

  User.all.each do |user|
    profile_id = user.profile.id
    Photo.create(file: File.open(File.join(::Rails.root, "/public/#{rand(1..2)}.jpg")), profile_id: profile_id)
    Photo.create(file: File.open(File.join(::Rails.root, "/public/3.jpg")), profile_id: profile_id)
  end
