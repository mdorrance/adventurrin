require 'rails_helper'

RSpec.describe Adventure, type: :model do
  before do
    login_user
  end
  context "a valid adventure" do
    let(:adventure) do
    Adventure.create(user_id:   "1",
                  latitude:  "1234567890",
                  longitude: "1234567890",
                  location_name: "Turing",
                  location_img_url: "http://awesome")
                end

  it "has a user_id" do
    expect(adventure.user_id).to eq 1
  end

  it "has a latitude" do
    expect(adventure.latitude).to eq 1234567890.0
  end

  it "has a longitude" do
    expect(adventure.longitude).to eq 1234567890.0
  end

  it "has a location_name" do
    expect(adventure.location_name).to eq "Turing"
  end

  it "has an location_img_url" do
    expect(adventure.location_img_url).to eq "http://awesome"
  end

end
end
