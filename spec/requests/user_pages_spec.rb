require 'rails_helper'

RSpec.describe "UserPages", type: :request do
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { expect(page).to have_content(user.name) }
  end
end
