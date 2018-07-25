class Patient < ApplicationRecord

	enum appointment_statuses: {pending: '0', under_treatment: '1', complete: '2'}
	enum gender: {male: '0', female: '1'}
	enum statuses: {normal: '0', observation: '1', recovery: '2', discharged: '3'}

	belongs_to :doctor
	belongs_to :hospital

	has_one :prescription

end
