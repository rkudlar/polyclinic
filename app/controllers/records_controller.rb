class RecordsController < ApplicationController
  load_and_authorize_resource

  def index
    @records = RecordsService.new(params).call
  end

  def show
    record
  end

  def new
    @record = Record.new(record_params)
    if @record.save
      flash[:success] = 'Created!'
    else
      flash[:danger] = 'Incorrect!'
    end
    redirect_to root_path
  end

  def edit
    record
  end

  def update
    if record.update(record_params)
      record.update(status: false)
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
end
