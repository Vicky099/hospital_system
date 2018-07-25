class MedicalStore < ApplicationRecord

	enum status: {active: '0', inactive: '1'}
	belongs_to :hospital

	def active_medical_store
		return self if self.status == 'active'
	end
end
