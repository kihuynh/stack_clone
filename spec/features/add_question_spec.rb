require 'rails_helper'

describe 'the add question process' do
  before(:each) do
    binding.pry
  end
  
  it 'adds a new question' do
    sessions
    visit questions_path
    click_link 'New Question'
    fill_in 'Question', :with => 'What?'
    click_on 'Create Question'
    expect(page).to have_content 'What?'
  end
end
