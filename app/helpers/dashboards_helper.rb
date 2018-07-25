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
end
