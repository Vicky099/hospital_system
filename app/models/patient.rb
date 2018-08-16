class Patient < ApplicationRecord

	enum appointment_statuses: {pending: '0', under_treatment: '1', complete: '2'}
	enum gender: {male: '0', female: '1'}
	enum statuses: {normal: '0', observation: '1', recovery: '2', discharged: '3'}

	belongs_to :doctor
	belongs_to :hospital

	has_many :prescriptions

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :address, presence: true
	validates :contact_num, presence: true
	validates :gender, presence: true
	validates :date_of_birth, presence: true
	validates :age, presence: true
	validates :gen_obs, presence: true
	validates :major_obs, presence: true
	validates :disease_found, presence: true
	validates :status, presence: true

end
