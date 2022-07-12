require 'rails_helper'
require 'pry'

RSpec.feature 'Write a recommendation', type: :feature do
  let(:category) { create(:category) }
  let(:doctor) { create(:doctor) }
  let(:user) { create(:user) }
  let(:record) { create(:record, doctor_id: 1) }

  scenario '1' do
    visit new_doctor_session_path
    within('#new_doctor') do
      fill_in 'doctor_phone_number', with: doctor.phone_number
      fill_in 'doctor_password', with: doctor.password
    end
    click_button('Log in')
    expect(page).to have_content doctor.name

    visit edit_record_path(record)
    fill_in 'record_recommendation', with: 'Some recommendations'
    click_button('Відправити')

    visit record_path(record)
    expect(page).to have_text('Some recommendations')
  end
end
