require "capybara/rspec"
require "./app"
require "pry"
require('spec_helper')

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

describe(".find") do
  it("returns a list by its ID") do
    test_list = List.new({:name => "Epicodus stuff", :id => nil})
    test_list.save
    test_list2 = List.new({:name => "Home stuff", :id => nil})
    test_list2.save
    expect(List.find(test_list2.id)).to(eq(test_list2))
  end
end

describe('adding tasks to a list', {:type => :feature}) do
  it('allows a user to add a task to a list') do
    test_list = List.new({:name => 'School stuff', :id => nil})
    test_list.save
    visit("/lists/#{test_list.id()}")
    fill_in("description", {:with => "Learn SQL"})
    fill_in("due_date", {:with => "2017-05-06"})
    click_button("Add task")
    expect(page).to have_content("Success! Your task has been added")
  end
end
