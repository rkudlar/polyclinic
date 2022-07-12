require 'rails_helper'

RSpec.describe Admins::CategoriesController, type: :controller do
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
        expect(assigns(:categories)).to eq(Category.all)
      }
    end

    context '#new' do
      before do
        get :new
      end

      it { expect(assigns[:category]).to be_instance_of(Category) }
      it { is_expected.to render_template(:new) }
    end

    context '#edit' do
      before do
        get :edit, params: params
      end

      let(:category) { create :category }
      let(:params) { { id: category.id } }

      it { expect(assigns[:category]).to eq(Category.find_by(id: params[:id])) }
      it { is_expected.to render_template(:edit) }
    end

    context '#create valid' do
      before do
        post :create, params: params
      end

      let(:params) { { category: { name: 'Spec' } } }

      it { expect(assigns[:category].name).to eq('Spec') }
    end

    context '#create invalid' do
      before do
        post :create, params: params
      end

      let(:params) { { category: { name: '' } } }

      it { is_expected.to render_template(:new) }
    end

    context '#update valid' do
      before do
        patch :update, params: params
      end

      let(:category) { create :category }
      let(:params) { { id: category.id, category: { name: 'Spec' } } }

      it { expect(category.reload.name).to eq('Spec') }
      it { is_expected.to redirect_to(admins_categories_path) }
    end

    context '#update invalid' do
      before do
        patch :update, params: params
      end

      let(:category) { create :category }
      let(:params) { { id: category.id, category: { name: '' } } }

      it { is_expected.to render_template(:edit) }
    end

    context '#destroy' do
      let!(:category) { create :category }
      let!(:params) { { id: category.id } }
      it { expect { delete :destroy, params: params }.to change(Category, :count).by(-1) }
    end
  end
end
