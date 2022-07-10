module Admins
  class DoctorsController < AdminController
    def index
      @doctors = Doctor.all
    end

    def new
      @doctor = Doctor.new
    end

    def edit
      doctor
    end

    def create
      @doctor = Doctor.new(doctor_params)
      if @doctor.save
        flash[:success] = 'Created!'
        redirect_to admins_doctors_path
      else
        flash[:danger] = 'Incorrect!'
        render 'new'
      end
    end

    def update
      if doctor.update(doctor_params)
        flash[:success] = 'Updated!'
        redirect_to admins_doctors_path
      else
        flash[:danger] = 'Incorrect!'
        render 'edit'
      end
    end

    def destroy
      doctor.destroy!
      redirect_to admins_doctors_path
    end

    private

    def doctor_params
      params.require(:doctor).permit(:name, :surname, :phone_number, :avatar_picture, :category_id, :password)
    end

    def doctor
      @doctor = Doctor.find(params[:id])
    end
  end
end
