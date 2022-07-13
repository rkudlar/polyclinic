require 'rails_helper'

RSpec.feature 'Write a recommendation', type: :feature do
  let(:category) { create(:category) }
  let(:doctor) { create(:doctor) }
  let(:user) { create(:user) }
  let(:record) { create(:record, user_id: user.id, doctor_id: doctor.id) }

  scenario 'log in as a doctor and leave a recommendation for a patient' do
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
