require 'rails_helper'

RSpec.describe Admins::UsersController, type: :controller do
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
        expect(assigns(:users)).to eq(User.all)
      }
    end

    context '#destroy' do
      let!(:user) { create :user }
      let!(:params) { { id: user.id } }
      it { expect { delete :destroy, params: params }.to change(User, :count).by(-1) }
    end
  end
end
