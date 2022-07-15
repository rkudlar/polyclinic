class RecordsController < ApplicationController
  load_and_authorize_resource

  def index
    @records = RecordsService.new(params[:status]).call
  end

  def show
    record
  end

  def create
    @record = Record.new(record_params)
    check_if_valid_record? && @record.save ? flash[:success] = 'Created!' : flash[:danger] = 'Incorrect!'
    redirect_to root_path
  end

  def edit
    record
  end

  def update
    if record.update(record_params.merge(status: false))
      flash[:success] = 'Updated!'
      redirect_to records_path
    else
      flash[:danger] = 'Incorrect!'
      render 'edit'
    end
  end

  private

  def record_params
    params.require(:record).permit(:user_id, :doctor_id, :recommendation)
  end

  def record
    @record = Record.find(params[:id])
  end

  def check_if_valid_record?
    return false unless @record.count_active_doctor_records < 10 &&
                        Record.where(doctor_id: @record.doctor_id, user_id: current_user.id, status: true).empty?

    true
  end
end
