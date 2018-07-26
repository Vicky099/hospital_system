class Prescription < ApplicationRecord

	has_many :medicines
	belongs_to :patient

	accepts_nested_attributes_for :medicines, :allow_destroy => true

	def self.random_prescription_number_generation(doctor_id, patient_id)
		number = '0'+doctor_id.to_s+Random.new.rand((5**(5 - 1))..(5**5)).to_s+patient_id.to_s
	end

end
