class Api::V1::MedicationsController < ApplicationController
  before_action :set_medication, only: %i[show update destroy]
  # skip_before_action :verify_authenticity_token

  # GET /medications
  def index
    @medications = Medication.all
    render json: @medications
  end

  # GET /medications/1
  def show
    render json: @medication
  end

  # POST /medications
  def create
    @medication = Medication.new(medication_params)

    if @medication.save
      render json: @medication, status: :created, location: @medication
    else
      render json: @medication.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /medications/1
  def update
    if @medication.update(medication_params)
      render json: @medication
    else
      render json: @medication.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medications/1
  def destroy
    @medication.destroy
    render json: { message: 'Medication deleted successfully' }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_medication
    @medication = Medication.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def medication_params
    params.require(:medication).permit(:generic_name, :dosage_text, :directions, :dosage_form, :active_substance, :route, :dosage_amount, :id)
  end
end
