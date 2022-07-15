class HomeController < ApplicationController
  def index
    @doctors = DoctorsService.new(params[:category_id]).call
  end
end
