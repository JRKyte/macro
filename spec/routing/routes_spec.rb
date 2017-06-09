require 'rails_helper'

describe 'routes' do
  it { is_expected.to route(:get, '/').to(controller: :application, action: :index) }
end
