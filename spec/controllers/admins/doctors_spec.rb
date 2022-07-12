require 'rails_helper'

RSpec.describe Admins::DoctorsController, type: :controller do
  describe 'when admin not logged' do
    it {
      get :index
      is_expected.to redirect_to('/admins/sign_in')
    }
  end

  describe 'when admin logged' do
    before do
      sign_in create(:admin)
    end

    context '#index' do
      it {
        get :index
        expect(assigns(:doctors)).to eq(Doctor.all)
      }
    end

    context '#new' do
      before do
        get :new
      end

      it { expect(assigns[:doctor]).to be_instance_of(Doctor) }
      it { is_expected.to render_template(:new) }
    end

    context '#edit' do
      before do
        get :edit, params: params
      end

      let(:doctor) { create :doctor }
      let(:params) { { id: doctor.id } }

      it { expect(assigns[:doctor]).to eq(Doctor.find_by(id: params[:id])) }
      it { is_expected.to render_template(:edit) }
    end

    context '#create valid' do
      before do
        post :create, params: params
      end
      let(:category) { create :category }
      let(:params) do
        { doctor: { name: 'Spec', surname: 'Surname', phone_number: '+380501122333',
                                 avatar_picture: add_image('spec/support/assets/doctor/icon-256x256.png'),
                                 category_id: category.id, password: 'password' } }
      end

      it { expect(assigns[:doctor].name).to eq('Spec') }
    end

    context '#create invalid' do
      before do
        post :create, params: params
      end

      let(:params) { { doctor: { name: '' } } }

      it { is_expected.to render_template(:new) }
    end

    context '#update valid' do
      before do
        patch :update, params: params
      end

      let(:doctor) { create :doctor }
      let(:params) { { id: doctor.id, doctor: { name: 'Spec' } } }

      it { expect(doctor.reload.name).to eq('Spec') }
      it { is_expected.to redirect_to(admins_doctors_path) }
    end

    context '#update invalid' do
      before do
        patch :update, params: params
      end

      let(:doctor) { create :doctor }
      let(:params) { { id: doctor.id, doctor: { name: '' } } }

      it { is_expected.to render_template(:edit) }
    end

    context '#destroy' do
      let!(:doctor) { create :doctor }
      let!(:params) { { id: doctor.id } }
      it { expect { delete :destroy, params: params }.to change(Doctor, :count).by(-1) }
    end
  end
end
