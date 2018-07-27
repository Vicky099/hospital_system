module DashboardsHelper

	def total_patient_count
		current_doctor.patients.count
	end

	def todays_patient_count
		current_doctor.patients.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).count
	end

	def pending_appointment_count
		current_doctor.patients.where(appointment_status: 'pending').count
	end

	def todays_earning
		amount = []
		current_doctor.patients.each{|patient| amount << patient.prescriptions.pluck(:doctor_bill_amount).map(&:to_i).sum}
		return amount.compact.sum
	end
end
