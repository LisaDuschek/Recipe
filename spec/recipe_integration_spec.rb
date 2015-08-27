require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the creating a recipe path", {:type => :feature}) do
  it('will allow the user to add a recipe') do
    visit('/')
    click_link('Add a new recipe')
    fill_in('name', :with => 'Grandmas cake')
    click_button('Add recipe!')
    expect(page).to have_content('Go')
  end
end

describe("editing a recipe", {:type => :feature}) do
  it('will allow the user to add ingredients to a recipe') do
    Recipe.create({:name => 'Grandmas cake', :rating => 5})
    visit('/')
    click_link('Go')
    fill_in('name', :with => 'Flour')
    fill_in('amount', :with => '1 lb')
    click_button('Add')
    expect(page).to have_content('Flour')
  end
end
