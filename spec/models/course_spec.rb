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

  context 'code' do
    it 'generate a random code when creating' do
      course = create(:course)
      expect(course.code).to be_present
    end

    it 'generate another code if repeats' do
      course = create(:course)
      another_course = build(:course)
      allow(SecureRandom).to receive(:base58).and_return(course.code, 'f1DoB2djcqMmEcx4qCtm')
      another_course.save
      expect(course.code).not_to eq(another_course.code)
    end
  end
end
