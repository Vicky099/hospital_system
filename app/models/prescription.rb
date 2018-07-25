class Prescription < ApplicationRecord

	has_many :medicines
	belongs_to :patient

	accepts_nested_attributes_for :medicines, :allow_destroy => true

end
