FactoryBot.define do

  sequence :email do |n|
    "user#{n}@test.com"
  end

  factory :user do
    name 'Oleg'
    username "PaTrik_88"
    password '12345678'
    email
    background "#005a55"
  end
end