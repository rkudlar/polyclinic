require_relative 'factory_helpers'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot::SyntaxRunner.include Support::FactoryHelpers
