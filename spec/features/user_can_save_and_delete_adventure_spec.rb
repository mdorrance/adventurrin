require "rails_helper"

RSpec.describe "User can see feed", type: :feature do
  context "A user with an instagram account" do

    it "renders feed" do
      VCR.use_cassette("user_saves_an_adventure_test#feed") do
        visit root_path
        login_user

        click_link "Login"

        within(".navbar") do
          expect(page).to have_content "heshekids"
        end
        find("a[data-target='#photo-1085839242808390881_1775839476']").click

        within("#photo-1085839242808390881_1775839476") do
          find(".create-adventure").click
        end

        visit feed_path
        
        within(".saved-adventure") do
          expect(page).to have_content "Steamboat Springs, Colorado"
        end

      end
    end

    xit "renders feed without locations" do
      VCR.use_cassette("user_who_has_no_friends_with_locations_sees_feed_with_locations_test#feed") do
        visit root_path
        login_user_no_location_feed

        click_link "Login"

        within(".navbar") do
          expect(page).to have_content "adventurrus"
        end
        expect(page).to have_content "drone_365"
        expect(page).to have_content "Cafecito"
        expect(page).to have_content "+1-312-922-2233"
      end
    end
  end
end
