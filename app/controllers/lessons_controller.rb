class LessonsController < ApplicationController
  before_action :authenticate_user!, only: %i[show]
  before_action :set_course, only: %i[new create]
  before_action :set_lesson, only: %i[show]
  before_action :user_has_enrollment, only: %i[show]

  def show
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = @course.lessons.new(lesson_params)
    if @lesson.save
      redirect_to @course, notice: 'Aula cadastrada com sucesso'
    else
      render :new
    end
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def user_has_enrollment
    redirect_to @lesson.course unless current_user.courses.include?(@lesson.course)
  end

  def lesson_params
    params.require(:lesson).permit(:name, :duration, :content)
  end
end
