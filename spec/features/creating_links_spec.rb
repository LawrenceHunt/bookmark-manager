require 'spec_helper'

feature 'Creating Links' do
  scenario 'submit a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://makersacademy.com'
    fill_in 'title', with: 'Makers Academy'
    click_button 'Create Link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
