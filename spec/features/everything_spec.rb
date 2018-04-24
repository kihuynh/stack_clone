require 'rails_helper'

describe 'the add question process' do
  before(:each) do
    visit '/signup'
    fill_in 'Email', :with => 'email@gmail.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign Up'
  end

  it 'adds a new question' do
    visit questions_path
    click_link 'New Question'
    fill_in 'Question', :with => 'What?'
    click_on 'Create Question'
    expect(page).to have_content 'What?'
  end

  it 'deletes a question' do
    FactoryBot.create(:question, :question => 'What?')

    visit questions_path
    click_link 'Delete Question'
    expect(page).to_not have_content 'What?'
  end

  it 'user sign in' do
    click_link 'Sign out'
    expect(page).to have_content 'Sign in'
  end
end
