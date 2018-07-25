class Medicine < ApplicationRecord

	belongs_to :prescription

	def medicine_times
		return [['before lunch', 'before_lunch'],['after lunch', 'after_lunch']]
	end

	def timings_on_prescription
		m_time = a_time = n_time = ''
		if self.morning.to_s == 'YES'
			m_time = "<b>Morning</b> : #{self.morning_time.gsub('_',' ').titleize}<br/>"
		end
		if self.afternoon.to_s == 'YES'
			a_time = "<b>Afternoon</b> : #{self.afternoon_time.gsub('_',' ').titleize}<br/>"
		end
		if self.night.to_s == 'YES'
			n_time = "<b>Night</b> : #{self.night_time.gsub('_',' ').titleize}<br/>"
		end
		return (m_time+a_time+n_time).html_safe
	end
end
