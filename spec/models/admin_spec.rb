require 'rails_helper'

RSpec.describe Admin, type: :model do
  context 'valid' do
    let(:admin) { create(:admin) }
    it { expect(admin).to be_valid }
  end

  context 'invalid phone number' do
    let(:admin) { build :admin, :with_invalid_phone }
    it { expect(admin).to_not be_valid }
  end

  context 'invalid password' do
    let(:admin) { build :admin, :with_invalid_password }
    it { expect(admin).to_not be_valid }
  end
end
