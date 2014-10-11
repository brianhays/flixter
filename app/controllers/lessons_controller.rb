class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :require_auth_for_course_lessons, only: [:show]


	def show
	end

	private

	helper_method :current_lesson
	def current_lesson
		@current_lesson ||= Lesson.find(params[:id])
	end

	def require_auth_for_course_lessons
    	if !current_user.enrolled_in?(current_lesson.section.course)
      		redirect_to course_url(current_lesson.section.course), alert: "You must be enrolled to view the lessons"
    	end
  	end
end
