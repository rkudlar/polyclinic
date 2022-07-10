module Admins
  class AdminController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!

    def index
      redirect_to admins_doctors_path
    end
  end
end
