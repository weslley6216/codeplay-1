class LessonsController < ApplicationController
  before_action :set_course, only: %i[new create]

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = @course.lessons.create!(lesson_params)
    redirect_to @course, notice: 'Aula cadastrada com sucesso'
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def lesson_params
    params.require(:lesson).permit(:name, :duration, :content)
  end
end