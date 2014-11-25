class AssignmentsController < ApplicationController

  before_action do
    @person = Person.find(params[:person_id])
  end

  def new
    @assignment = @person.assignments.new
  end

  def create
    @assignment = @person.assignments.new(params.require(:assignment).permit(:location_id, :role))
    if @assignment.save
      redirect_to @person
    else
      render :new
    end
  end

  def edit
    @assignment = @person.assignments.find(params[:id])
  end

  def update
    @assignment = @person.assignments.find(params[:id])
    if @assignment.update(params.require(:assignment).permit(:location_id, :role))
      redirect_to @person
    else
      render :edit
    end
  end

  def destroy
    @assignment = @person.assignments.find(params[:id])
    @assignment.destroy
    redirect_to person_path(@person)
  end

end
