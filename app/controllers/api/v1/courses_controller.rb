class Api::V1::CoursesController < ActionController::API
  def index
    @courses = Course.all
    render json: @courses
      .as_json(except: [:id, :created_at, :updated_at, :instructor_id], 
               include: :instructor)
  end

  def show
    @course = Course.find_by!(code: params[:code])
    render json: @course
  rescue ActiveRecord::RecordNotFound
    head 404
  end

  def create
    @course = Course.new(course_params)
    @course.save!
    render json: @course, status: :created
  end

  private

  def course_params
    params
      .require(:course)
      .permit(:name, :description, :code, :price, :instructor_id,
              :enrollment_deadline, :banner)
  end
end