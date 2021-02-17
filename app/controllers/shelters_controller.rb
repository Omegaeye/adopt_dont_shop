class SheltersController < ApplicationController

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
  end

  def create
    @shelter = Shelter.create(shelter_params)
    if @shelter.save
      flash[:success] = "Shelter successfully saved!"
      redirect_to shelters_path
    else
      flash[:error] = "Shelter was not saved!"
      render :new
    end
  end

  def edit
    @shelter = Shelter.find(params[:id])
  end

  def update
    @shelter = Shelter.update(shelter_params)
      redirect_to "/shelters/#{@shelter.first.id}"
  end

  def destroy
    Shelter.destroy(params[:id])
    redirect_to shelters_path
  end

  private
  def shelter_params
    params.permit(:name, :address, :city, :state, :zip)
  end
end
