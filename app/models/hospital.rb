class Hospital < ApplicationRecord

  enum type_of_hospital: {owner: '0', visitor: '1'}

  validates	:name, presence: true
  validates :registration_num, uniqueness: true, presence: true
  validates :type_of_hospital, presence: true

  belongs_to :doctor
  has_many :patients
  has_many :medical_stores

  def active_medical_store
  	self.medical_stores.where(status: 'active').first
  end
end
