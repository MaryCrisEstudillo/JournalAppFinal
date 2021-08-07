require 'rails_helper'

RSpec.describe "EditTasks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'edit to update the task details' do
    visit '/tasks/new'
    fill_in 'Title', with: 'task title'
    fill_in 'Body', with: 'task body'
    click_on 'ADD'
    
    task = Task.order("id").last
    visit "/tasks/#{category.id}/edit"
    fill_in 'Title', with: 'task title edited'
    fill_in 'Body', with: 'task body edited'
    click_on 'UPDATE'

    expect(page).to have_content('task title edited')
    expect(page).to have_content('task body edited')
     
    task = Task.order("id").last
    expect(task.title).to eq('task title edited')
    expect(task.body).to eq('task body edited')
  end
end