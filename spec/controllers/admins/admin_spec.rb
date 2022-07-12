require 'rails_helper'

RSpec.describe Admins::AdminController, type: :controller do
  before do
    sign_in create(:admin)
  end
  it { get :index }
end
