FactoryBot.define do
  factory :note do
    title { Faker::Lorem.sentence(word_count: 3) }
    body  { Faker::Lorem.paragraph(sentence_count: 3) }
    date  { Faker::Date.between(from: 3.days.ago, to: Date.today) }
  end
end
