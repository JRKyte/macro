require 'rails_helper'

describe ApplicationController do
  describe '#index' do
    subject { get root_path }

    context 'not signed in' do
      it { is_expected.to redirect_to new_user_session_path }
    end

    context 'signed in' do
      before { sign_in FactoryGirl.build(:user) }
      it { is_expected.to render_template(:index) }
    end
  end
end
