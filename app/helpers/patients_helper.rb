module PatientsHelper

	def appointment_status_data(patient)
		msg = ''
		status = ''
		if patient.appointment_status == "pending"
			msg = 'danger'
			status = 'Pending'
		elsif patient.appointment_status == "presc_ready"
			msg = 'warning'
			status = 'Prescribed'
		elsif patient.appointment_status == 'bill_generate'
			msg = 'info'
			status = 'Generate Bill'
		elsif patient.appointment_status == 'submit_to_medical_store'
			msg = 'default'
			status = 'Medical Store'
		elsif patient.appointment_status == "medical_done"
			msg = 'success'
			status = "Complete"
		end

		return "<span class='label label-#{msg}'>#{status}</span>"
	end
end
