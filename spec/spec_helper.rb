ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    Ingredient.all().each() do |x|
      x.destroy()
    end
    Recipe.all().each() do |x|
      x.destroy()
    end
    Tag.all().each() do |x|
      x.destroy()
    end
    Instruction.all().each() do |x|
      x.destroy()
    end
  end
end
