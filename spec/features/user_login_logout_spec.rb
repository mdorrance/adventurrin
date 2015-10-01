require "rails_helper"

RSpec.describe "User logs in", type: :feature do
  context "A user with an instagram account" do
    it "logs in" do
      visit root_path
      login_user

      click_link "Login"
      expect(current_path).to eq feed_path
    end

    it "logs out" do
      VCR.use_cassette("user_login_test#logout") do
        visit root_path
        login_user

        click_link "Login"
        within(".navbar") do
          click_link "heshekids"
        end

        expect(current_path).to eq profile_path

        click_link "Log out"
        expect(current_path).to eq root_path
      end
    end

  end
end
