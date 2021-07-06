FactoryBot.define do
  factory :lesson do
    name { 'Classes e Objetos' }
    duration { rand(1..10) }
    content { 'Uma aula de Ruby' }
    course
  end
end
