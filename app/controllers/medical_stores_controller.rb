class MedicalStoresController < ApplicationController
	layout 'application'
	before_action :authenticate_user!
	before_action :current_hospital, only: [:index, :show, :create, :new, :edit, :update]
	before_action :current_medical_store, only: [:show, :edit, :update]

	def index
		@medical_stores = @current_hospital.medical_stores.order('created_at DESC')
	end

	def new
		active_medical_partner = @current_hospital.medical_stores.where(status: 'active').first
		if active_medical_partner.present?
			flash[:alert] = "You can not add more than one active medical partner. please de-activate current medical partner."
			redirect_to edit_hospital_medical_store_path(hospital_id: @current_hospital.id, id: active_medical_partner.id)
		else
			@medical_store = @current_hospital.medical_stores.new
		end
	end

	def create
		@medical_store = @current_hospital.medical_stores.build(medical_store_params)
		if @medical_store.save
			#trigger greeting mail to medical partner
			flash[:success] = "You have successfully added medial partner"
			redirect_to hospital_medical_stores_path
		else
			flash[:alert] = "Something went wrong."
			@errors = @medical_store.errors.messages
			render :new
		end
	end

	def show
	end

	def edit

	end

	def update
		if @medical_store.update_attributes(medical_store_params)
			flash[:success] = "We have updated medical store partner details successfully."
			redirect_to hospital_medical_stores_path
		else
			flash[:alert] = "Something went wrong"
			@errors = @medical_store.errors.messages
			render :edit
		end
	end

	private

	def medical_store_params
		params.require(:medical_store).permit(:owner, :name, :address, :contact_no, :status, :gst_no, :pancard_no, :hospital_id)
	end

	def current_medical_store
		@medical_store = MedicalStore.find_by_id(params[:id])
		if !@medical_store.present?
			flash[:alert] = "Record not found."
  		redirect_to medical_stores_path
  	end
	end

	def current_hospital
		@current_hospital = current_doctor.hospitals.find_by_id(params[:hospital_id])
		if !@current_hospital.present?
			flash[:alert] = 'No record found.'
			redirect_to hospitals_path
		end
	end
end
