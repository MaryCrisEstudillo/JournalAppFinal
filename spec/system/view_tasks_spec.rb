require 'rails_helper'

RSpec.describe "ViewTasks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'view a task and show its details' do

    visit '/tasks/new'
    fill_in 'Title', with: 'Sample tasks title'
    fill_in 'Body', with: 'Your sample tasks here'
    click_on 'ADD'
    
    task = Task.order("id").last
    visit "/tasks/#{task.id}"
    expect(page).to have_content('Your sample tasks here')
    
    task = Task.order("id").last
    expect(Task.body).to eq('Your sample tasks here')
  end

#  pending "add some scenarios (or delete) #{__FILE__}"
end
