class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def create
    @application = Application.new(applications_params)
    @application.save
    redirect_to "/applications/#{@application.id}"
  end

  def show
    if params[:pet_name]
      @pets = Pet.name_search(params[:pet_name])
      @application = Application.find(params[:id])
    elsif params[:pet_id]
      @pet = Pet.find(params[:pet_id])
      @application = Application.find(params[:id])
      @pet_applications = PetApplication.create(pet: @pet, application: @application)
      redirect_to "/applications/#{params[:id]}"
    else
      # @pet = Pet.find(params[:pet_id])
      @application = Application.find(params[:id])
    end
  end

  def update
    if params[:pet_id]
    end
  end

  def destroy
    Application.destroy(params[:id])
    redirect_to '/applications'
  end

  private
  def applications_params
    params.permit(:name, :address, :city, :state, :zip, :description, :status)
  end

end
