ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

module AuthHelper
  def auth_headers(user)
    # Simulate sign in to get token
    post user_session_path, params: { user: { email: user.email, password: "password" } }
    token = response.headers["Authorization"]
    {
      "Authorization" => token,
      "Content-Type" => "application/json"
    }
  end
end

class ActionDispatch::IntegrationTest
  include AuthHelper
end
