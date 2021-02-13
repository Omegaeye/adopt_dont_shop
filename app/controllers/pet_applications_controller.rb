class PetApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def create

  end

end
