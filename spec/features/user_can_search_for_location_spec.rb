require "rails_helper"

RSpec.describe "User can search for location", type: :feature do
  context "A user with an instagram account" do

    it "renders location search box and positive results" do
      VCR.use_cassette("user_sees_location_search_test#user") do
        visit root_path
        login_user

        click_link "Login"

        within(".navbar") do
          expect(page).to have_content "heshekids"
        end
        within("#location-search") do
          fill_in "search locations", :with => "St Charles IL"
          click_link_or_button "search-locations"
        end

        expect(current_path).to eq locations_path
        expect(page).to have_content "St Charles IL"

      end
    end

    it "renders location box and NO results" do
      VCR.use_cassette("user_sees_location_search_test#sadpath") do
        visit root_path
        login_user

        click_link "Login"

        within(".navbar") do
          expect(page).to have_content "heshekids"
        end
        within("#location-search") do
          fill_in "search locations", :with => ""
          click_link_or_button "search-locations"
        end

        expect(current_path).to eq feed_path
        within(".alert") do
          expect(page).to have_content "Sorry but you need to enter a location :)"
        end
      end
    end

    it "renders location search box and NO results" do
      VCR.use_cassette("user_sees_location_search_test#invalid_string") do
        visit root_path
        login_user

        click_link "Login"

        within(".navbar") do
          expect(page).to have_content "heshekids"
        end
        within("#location-search") do
          fill_in "search locations", :with => "k14891%$#j????*&%asdpvnafpiuans;ogdn;a!skvdnoa@sndf;askd"
          click_link_or_button "search-locations"
        end

        expect(current_path).to eq feed_path
        within(".alert") do
          expect(page).to have_content "Sorry but according to Google, that location doesn\'t exist. Try another one :\)"
        end
      end
    end
  end
end
