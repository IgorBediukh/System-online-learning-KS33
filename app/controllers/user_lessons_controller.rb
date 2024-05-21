# frozen_string_literal: true

class UserLessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_lesson, only: [:update]

  def index
    @user_lessons = UserLesson.where(lesson_id: params[:lesson_id])
    @lesson = @user_lessons.first&.lesson
  end

  def create
    lesson = Lesson.create(user_lesson_create_params)
    if lesson.save
      business_model_id = user_lesson_create_params[:business_model_id]
      users = User.joins(:business_models).where(role: 0, business_models: { id: business_model_id })
      users.each do |user|
        UserLesson.create(lesson_id: lesson.id, user_id: user.id)
      end
      redirect_to business_model_path(business_model_id)
    end
  end

  def update
    if @user_lesson.update(user_lesson_params)
      redirect_to user_lessons_path(lesson_id: @user_lesson.lesson.id), notice: 'User lesson was successfully updated.'
    end
  end

  private

  def set_user_lesson
    @user_lesson = UserLesson.find(params[:id])
  end

  def user_lesson_params
    params.require(:user_lesson).permit(:grade, :attendance)
  end

  def user_lesson_create_params
    params.require(:user_lesson).permit(:lesson_type, :lesson_time, :business_model_id)
  end
end
