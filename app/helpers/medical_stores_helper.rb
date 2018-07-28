module MedicalStoresHelper

	def status_label(medical)
		if medical.status == 'active'
			msg = 'success'
		else
			msg = 'danger'
		end
		return "<span class='label label-#{msg}'>#{medical.status.to_s.titleize}</span>"
	end
end
