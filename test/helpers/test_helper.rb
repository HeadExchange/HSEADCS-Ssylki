ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  include Devise::Test::IntegrationHelpers
  include Warden::Test::Helpers

  def log_in(user)
    if integration_test?
      login_as(user, scope: :user)
    else
      sign_in(user)
    end
  end
end
