class PatientsController < ApplicationController
	before_action :authenticate_user!
	before_action :valid_patient, only:[:show, :edit, :update, :prescribe_medicine, :create_prescription, :generate_bill]
	before_action :own_hospitals, only:[:new, :create]

	def index
		if params[:today].to_s == 'true'
			@patients = current_doctor.patients.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order('created_at DESC')
		else
			@patients = current_doctor.patients.order('created_at DESC')
		end
	end

	def new
		@patient = current_doctor.patients.new
	end

	def create
		@patient = current_doctor.patients.build(patient_params)
		if @patient.save
			flash[:notice] = "Patient report added successfully. Please prescribe medicine's for #{@patient.first_name}."
			redirect_to prescribe_medicine_patient_path(@patient.id)
		else
			flash[:alert] = "something went wrong"
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @patient.update_attributes(patient_params)
			flash[:notice] = "patient report upated successfully."
		else
		end
	end

	def destroy
	end

	def prescribe_medicine
		@prescription = @patient.prescriptions.build(prescription_num: Prescription.random_prescription_number_generation(current_doctor.id, @patient.id))
		@medicine = @prescription.medicines.new
	end

	def create_prescription
		@prescription = @patient.prescriptions.build(prescription_params)
		if @prescription.save
			flash[:notice] = "Please re-verify medicine's and print the medicine prescription, we will forward same prescription to your medical partner. Thank You."
			redirect_to generate_bill_patient_path(id: @prescription.patient_id, preseq: @prescription.id)
		else
			flash[:alert] = "Something went wrong"
			render :prescribe_medicine
		end
	end

	def generate_bill
		@prescription = @patient.prescriptions.find_by_id(params[:preseq])
		@medical_store = @patient.hospital.active_medical_store
	end

	def prescriptions
		prescriptions = []
		current_doctor.patients.each do |patient|
			prescriptions << patient.prescriptions
		end
		@prescriptions = prescriptions.flatten
	end

	private
	def patient_params
		params.require(:patient).permit(:first_name, :last_name, :address, :contact_num, :gender, :date_of_birth, :age, :pulse, :bp, :gen_obs, :major_obs, :disease_found, :appointment_status, :status, :hospital_id)
	end

	def prescription_params
		params.require(:prescription).permit(:recheck_date, :doctor_bill_amount, :prescription_num, :no_of_days_medicine_taken, medicines_attributes: [:id,:prescription_id, :name, :morning, :morning_time, :afternoon, :afternoon_time, :night, :night_time, :status, :_destroy])
	end

	def valid_patient
		@patient = current_doctor.patients.where(id: params[:id]).first
		if !@patient.present?
			flash[:alert] = 'Invalid Access. please check with administrator.'
			redirect_to patients_path
		end
	end

	def own_hospitals
		@hospitals = current_doctor.hospitals
		@own_hospital = current_doctor.hospitals.where(type_of_hospital: 'owner').first
	end
end
