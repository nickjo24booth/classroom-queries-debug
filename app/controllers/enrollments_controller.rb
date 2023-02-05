class EnrollmentsController < ApplicationController
  def index
    matching_enrollments = Enrollment.all

    @list_of_enrollments = matching_enrollments.order({ :created_at => :desc })

    render({ :template => "enrollments/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_enrollments = Enrollment.where({ :id => the_id })

    @enrollment = matching_enrollments.at(0)

    render({ :template => "enrollments/show.html.erb" })
  end
end
