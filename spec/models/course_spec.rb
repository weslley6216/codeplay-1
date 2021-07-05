require 'rails_helper'

describe Course do
  context 'validation' do
    it { should validate_presence_of(:name).with_message('não pode ficar em branco') }
    it { should validate_presence_of(:code).with_message('não pode ficar em branco') }
    it { should validate_presence_of(:price).with_message('não pode ficar em branco') }

    it 'code must be uniq' do
      instructor = Instructor.create!(name: 'Fulano Sicrano',
                                      email: 'fulano@codeplay.com.br')
      Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                    code: 'RUBYBASIC', price: 10,
                    enrollment_deadline: '22/12/2033', instructor: instructor)
      course = Course.new(code: 'RUBYBASIC')

      course.valid?

      expect(course.errors[:code]).to include('já está em uso')
    end
  end
end