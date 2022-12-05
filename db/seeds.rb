100.times do |i|
  Article.create(title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph(sentence_count: 5))
end