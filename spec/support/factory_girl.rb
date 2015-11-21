# support for file uploads
include ActionDispatch::TestProcess

require 'factory_girl'
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
