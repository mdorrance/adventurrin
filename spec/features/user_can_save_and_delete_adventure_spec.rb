require "rails_helper"

RSpec.describe "User can save and delete an adventure", type: :feature do
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

      end
    end
  end
end
