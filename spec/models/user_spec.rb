require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_confirmation_of(:password) }

  context 'client' do
    subject { FactoryGirl.build(:user, :client) }

    it { is_expected.to validate_presence_of(:name) }
  end

  it { is_expected.to belong_to(:trainer) }
  it { is_expected.to have_many(:clients) }


  describe '#trainer?' do
    it { expect(FactoryGirl.build(:user, :client).trainer?).to eq(false) }
    it { expect(FactoryGirl.build(:user).trainer?).to eq(true) }
  end

  describe '#client?' do
    it { expect(FactoryGirl.build(:user).client?).to eq(false) }
    it { expect(FactoryGirl.build(:user, :client).client?).to eq(true) }
  end
end
