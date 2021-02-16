class Admin::ApplicationsController < ApplicationController

 def index
  @applications = Application.all
 end

 def show
   @application = Application.find(params[:id])
 end

 def update
   @application = Application.find(params[:id])
   if params[:approved]
     @pet = Pet.find(params[:approved])
     @pet_application = @application.pet_applications.where(pet_id: params[:approved])
     @pet_application.update(approved: "true")
     @pet.update(adoptable: false)
   else params[:rejected]
     @pet = Pet.where(id: params[:rejected])
     @pet_application = @application.pet_applications.where(pet_id: params[:rejected])
     @pet_application.update(approved: "false")
   end
   redirect_to "/admin/applications/#{@application.id}"
 end
end
