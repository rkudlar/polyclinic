class HomeController < ApplicationController
  def index
    @doctors = DoctorsService.new(params).call
  end
end
