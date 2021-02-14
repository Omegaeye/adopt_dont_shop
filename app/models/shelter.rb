class Shelter < ApplicationRecord
  has_many :pets, :dependent => :destroy
  has_many :applications, :dependent => :destroy
end
