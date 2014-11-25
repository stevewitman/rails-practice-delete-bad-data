class AssignmentsController < ApplicationController

  def new
    @person = Person.find(params[:person_id])
    @assignment = @person.assignments.new
  end

  def create
    @person = Person.find(params[:person_id])
    @assignment = @person.assignments.new(params.require(:assignment).permit(:location_id, :role))
    if @assignment.save
      redirect_to @person
    else
      render :new
    end
  end

end
