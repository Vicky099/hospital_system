class MedicalStore < ApplicationRecord

	enum status: {active: '0', inactive: '1'}
	belongs_to :hospital

	validates :owner, presence: true
	validates :name, presence: true
	validates :address, presence: true
	validates :contact_no, presence: true
	validates :gst_no, presence: true, uniqueness: true
	validates :pancard_no, presence: true, uniqueness: true

	def active_medical_store
		return self if self.status == 'active'
	end
end
