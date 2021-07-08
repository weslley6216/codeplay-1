class Api::V1::EnrollmentsController < Api::V1::ApiController
  def index
    @enrollments = Course.find(params[:course_id]).enrollments
    render json: @enrollments
      .as_json(except: %i[id updated_at student_id course_id],
               include: %i[student course])

  rescue ActiveRecord::RecordNotFound
    render status: :not_found, json: { errors: 'Curso não encontrado' }
  end
end