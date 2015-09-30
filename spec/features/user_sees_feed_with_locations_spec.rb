require "rails_helper"

RSpec.describe "User can see feed", type: :feature do
  context "A user with an instagram account" do

    it "renders feed" do
      VCR.use_cassette("user_sees_feed_with_locations_test#feed") do
        visit root_path
        login_user

        click_link "Login"

        within(".navbar") do
          expect(page).to have_content "heshekids"
        end

        expect(page).to have_content "rachelparri"
        expect(page).to have_content "Panda Garden 13522 Julie Dr Poplar Grove, IL 61065"
        expect(page).to have_content "West Maroon Pass, Maroon Bells Wilderness"

      end
    end
  end
end
