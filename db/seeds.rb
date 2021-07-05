raise 'Do not run seed on product' unless Rails.env.development?

instructor = Instructor.create!(name: 'Fulano Sicrano',
                                email: 'fulano@codeplay.com.br')
Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
              code: 'RUBYBASIC', price: 10,
              enrollment_deadline: '22/12/2033', instructor: instructor)
Course.create!(name: 'Ruby on Rails',
              description: 'Um curso de Ruby on Rails',
              code: 'RUBYONRAILS', price: 20,
              enrollment_deadline: '20/12/2033', instructor: instructor)