class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_applications, :dependent => :destroy
  has_many :applications, through: :pet_applications
  validates_presence_of :name, :description, :approximate_age, :sex

  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }

  enum sex: [:female, :male, :unknown]

  def self.name_search(name)
    where("name ILIKE ?", "%#{name}%")
  end

  def self.action_pets
    joins(:pet_applications).where(pet_applications: {approved: "none"})
  end

end
