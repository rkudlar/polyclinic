require 'rails_helper'

RSpec.describe Doctor, type: :model do
  let(:doctor) { create(:doctor) }

  it { expect(doctor).to be_valid }

  it { should validate_presence_of(:phone_number) }
  it { should validate_uniqueness_of(:phone_number).case_insensitive }
end
