class Shelter < ApplicationRecord
  has_many :pets, :dependent => :destroy
  validates :name, :address, :city, :state, :zip, presence: true

  def self.shelter_with_app_pending
    joins(pets: [{pet_applications: :application}]).where(applications: {status: "Pending"}).order("name")
  end
end
