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
          fill_in "search", :with => "St Charles IL"
          click_link_or_button "search-users"
        end

        expect(current_path).to eq user_search_path
        expect(page).to have_content "Tom"
        assert page.has_xpath?("//img[@alt='tleskin image' and @src = 'http://scontent.cdninstagram.com/hphotos-xpf1/t51.2885-19/10950442_771009492947847_327550978_a.jpg']")
        expect(page).to have_link "tleskin"

      end
    end

    it "renders user search box and NO results" do
      VCR.use_cassette("user_sees_tag_search_test#sadpath") do
        visit root_path
        login_user

        click_link "Login"

        within(".navbar") do
          expect(page).to have_content "heshekids"
        end
        within("#user-search") do
          fill_in "search", :with => ""
          click_link_or_button "search-users"
        end

        expect(current_path).to eq feed_path

      end
    end

    it "renders user search box and NO results" do
      VCR.use_cassette("user_sees_tag_search_test#invalid_string") do
        visit root_path
        login_user

        click_link "Login"

        within(".navbar") do
          expect(page).to have_content "heshekids"
        end
        within("#user-search") do
          fill_in "search", :with => "kdjasdpvna fpiuans;ogdn;askvdnoasndf;askd"
          click_link_or_button "search-users"
        end

        expect(current_path).to eq feed_path

      end
    end
  end
end
