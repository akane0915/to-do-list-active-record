require "capybara/rspec"
require "./app"
require "pry"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new list', {:type => :feature}) do
   it('allows a user to click a list to see the tasks and details for it') do
    visit('/')
    click_link('Add New List')
    fill_in('name', :with => 'Epicodus Work')
    click_button('Add List')
    expect(page).to have_content('Success!')
  end
end

# describe("the phrase parser path", {:type => :feature}) do
#    it("processes the user input and returns correct message if its a palindrome") do
#     visit("/")
#     fill_in("phrase1", :with => "madam")
#     click_button("")
#     expect(page).to have_content("'madam' is a palindrome")
#   end
# end
# describe("the phrase parser path", {:type => :feature}) do
#    it("processes the user input and returns correct message if its a palindrome") do
#     visit("/")
#     fill_in("phrase1", :with => "madam")
#     click_button("")
#     expect(page).to have_content("'madam' is a palindrome")
#   end
# end
