Dir["./spec/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

end