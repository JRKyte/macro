require 'rails_helper'

RSpec.describe ClientPolicy do

  let(:client) { FactoryGirl.create(:user, :client) }
  let(:trainer) { FactoryGirl.create(:user, client_count: 0) }

  subject { described_class }

  permissions :index? do
    it { expect(subject).to permit(trainer, nil) }
    it { expect(subject).to_not permit(client, nil) }
  end
end
