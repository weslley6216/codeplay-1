require 'rails_helper'

describe 'Enrollments API' do
  context 'GET /api/v1/courses/:id/enrollments' do
    it 'should get enrollments from course' do
      course = create(:course, name: 'Curso de Rails')
      student = create(:student, email: 'student@codeplay.com.br')
      Enrollment.create!(course: course, student: student)
      
      get "/api/v1/courses/#{course.id}/enrollments"

      expect(response).to have_http_status(200)
      expect(response.content_type).to include('application/json')
      parsed_body = JSON.parse(response.body)
      expect(parsed_body[0]['student']['email']).to eq('student@codeplay.com.br')
      expect(parsed_body[0]['course']['name']).to eq('Curso de Rails')

    end

    it 'should not show enrollment from different course' do
      course = create(:course, name: 'Curso de Rails')
      another_course = create(:course, name: 'Não é um Curso')
      student = create(:student, email: 'student@codeplay.com.br')
      Enrollment.create!(course: course, student: student)
      Enrollment.create!(course: another_course, student: student)
      
      get "/api/v1/courses/#{course.id}/enrollments"

      expect(response).to have_http_status(200)
      expect(response.content_type).to include('application/json')
      parsed_body = JSON.parse(response.body)
      expect(parsed_body[0]['student']['email']).to eq('student@codeplay.com.br')
      expect(parsed_body[0]['course']['name']).to eq('Curso de Rails')
      expect(parsed_body[0]['course']['name']).to_not eq('Não é um Curso')
    end

    it 'should send 404 if course not found' do
      get "/api/v1/courses/5/enrollments"

      expect(response).to have_http_status(404)
      expect(response.content_type).to include('application/json')
      parsed_body = JSON.parse(response.body)
      expect(parsed_body).to include("errors"=>'Curso não encontrado')
      
    end
  end

  private

  def parsed_body
    JSON.parse(response.body)
  end

end