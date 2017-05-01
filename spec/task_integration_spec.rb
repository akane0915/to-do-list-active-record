require "capybara/rspec"
require "./app"
require "pry"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new list', {:type => :feature}) do
   it('allows a user to add a new list') do
    visit('/')
    click_link('Add New List')
    fill_in('name', :with => 'Epicodus Work')
    click_button('Add List')
    expect(page).to have_content('Success!')
  end
end

describe('seeing details for a single list', {:type => :feature}) do
   it('allows a user to click a list to see the tasks and details for it') do
    test_list = List.new({:name => 'School Stuff', :id => nil})
    test_list.save
    test_task = Task.new({:description => 'learn SQL', :list_id => test_list.id, :due_date => '2017-05-01'})
    test_task.save
    visit('/lists')
    click_link(test_list.name)
    expect(page).to have_content(test_task.description)
  end
end
