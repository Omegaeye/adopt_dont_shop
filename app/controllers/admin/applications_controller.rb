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
     @pet_application = @application.pet_applications.where(pet_id: params[:approved])
     @pet_application.update(approved: "true")
     if @application.pet_applications.all?{|app| app.approved == "true"} == true
       @application.update(status: "approved")
       @pet = Pet.find(params[:approved])
       @pet.update(adoptable: false)
     end
   else params[:rejected]
     @pet_application = @application.pet_applications.where(pet_id: params[:rejected])
     @pet_application.update(approved: "rejected")
     if @application.pet_applications.all?{|app| app.approved != "none" } == true && @application.pet_applications.any?{|app| app.approved == "rejected" } == true
     @application.update(status: "Rejected")
     end
   end
   redirect_to "/admin/applications/#{@application.id}"
 end
end
