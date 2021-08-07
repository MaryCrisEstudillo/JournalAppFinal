require 'rails_helper'

RSpec.describe "CreatingTasks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'enables to create tasks' do
    visit '/tasks/new'

    fill_in 'Title', with: 'Sample tasks title'
    fill_in 'Body', with: 'Your sample tasks here'

    click_on 'Create New Task'

    expect(page).to have_content('Sample tasks title')
    expect(page).to have_content('Your sample tasks here')

    task = Task.order("id").last
    expect(task.title).to eq('Sample tasks title')
    expect(task.body).to eq('Your sample tasks here')
  end


  #pending "add some scenarios (or delete) #{__FILE__}"
end
