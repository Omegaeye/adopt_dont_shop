Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    root to: "admin#index"
    resources :shelters, :applications
  end

  get "/", to: "welcome#index"
  resources :shelters, :pets, :applications

  get "/shelters/:shelter_id/pets", to: "shelter_pets#index"
  get "/shelters/:shelter_id/pets/new", to: "shelter_pets#new"
  post "/shelters/:shelter_id/pets", to: "shelter_pets#create"
  get "/shelters/:id/pets/:id", to: "pets#show"

  post '/applications/:id', to: "pet_applications#create"

  # get '/admin/shelters', to: "admin#index"
  # get '/admin/applications/:id', to: "admin#show"
  # patch '/admins/applications/:id', to: "admin#show"


end
