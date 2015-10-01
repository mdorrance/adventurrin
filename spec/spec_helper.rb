
require 'simplecov'
require 'vcr'
require 'webmock'

SimpleCov.start do
  add_filter 'config'
  add_filter 'application_controller'
end

VCR.configure do |c|
  c.hook_into                 :webmock
  c.cassette_library_dir      = 'spec/support/vcr_cassettes'
end

RSpec.configure do |config|
  require 'capybara/rspec'
  require 'database_cleaner'
  require 'simplecov'

  SimpleCov.start 'rails'

  config.include Capybara::DSL

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  WebMock.stub_request(:any, "www.localhost:3000")

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end
  def user
    @user ||= User.new(name: "Mike Dorrance",
                       nickname: "heshekids",
                       image_url: "happy.jpg",
                       bio: "Cool!",
                       website: "dorrance.com",
                       token: ENV['instagram_test'],
                       uid: "1234",
                       provider: "instagram")
  end

  def user_with_no_location_feed
    @user_with_no_location_feed ||= User.new(name: "Mike Dorrance",
                                             nickname: "adventurrus",
                                             image_url: "happy.jpg",
                                             bio: "Cool!",
                                             website: "adventurrus.com",
                                             token: ENV['instagram_sad_test'],
                                             uid: "123456",
                                             provider: "instagram")
  end

  def login_user_no_location_feed
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new ({
      'provider'    => user_with_no_location_feed.provider,
      'uid'         => user_with_no_location_feed.uid,
      'info'        => {:name =>user_with_no_location_feed.name,
                        :nickname =>user_with_no_location_feed.nickname,
                        :bio =>user_with_no_location_feed.bio,
                        :website =>user_with_no_location_feed.website,
                        :image =>user_with_no_location_feed.image_url},
      'credentials' => {:token => ENV['instagram_sad_test']}
    })
  end

  def login_user
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new ({
      'provider'    => user.provider,
      'uid'         => user.uid,
      'info'        => {:name =>user.name,
                        :nickname =>user.nickname,
                        :bio =>user.bio,
                        :website =>user.website,
                        :image =>user.image_url},
      'credentials' => {:token => ENV['instagram_test']}
    })
  end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end

end
