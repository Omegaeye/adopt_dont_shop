class Application < ApplicationRecord
  has_many :pet_applications, :dependent => :destroy
  has_many :pets, through: :pet_applications, :dependent => :destroy
  validates_presence_of :name, :address, :city, :state, :zip, :description, :status
  after_initialize :default, unless: :persisted?


  def default
    self.status = "In Progress"
    self.description = "<Please tell why you will be good for this pet>"
  end

end
