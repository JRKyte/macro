require 'rails_helper'

RSpec.describe "Clients", type: :request do
  describe "GET /clients" do
    subject { get clients_path }

    context 'not signed in' do
      it { is_expected.to redirect_to new_user_session_path }
    end

    context 'signed in as client' do
      before { sign_in FactoryGirl.create(:user, :client) }
      it { is_expected.to redirect_to root_path }
    end

    context 'signed in as trainer' do
      before { sign_in FactoryGirl.create(:user) }
      it { is_expected.to render_template(:index) }
    end
  end
end
