require 'spec_helper'

feature 'Adding Tags' do
  scenario 'add a single tag to a link' do
    visit '/links/new'
    fill_in 'url', with: 'Makers Academy'
    fill_in 'title', with: 'http://makersacademy.com'
    fill_in 'tags', with: 'education'

    click_button 'Create Link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('education')
    end

    scenario 'I can add multiple tags to a new link' do
      visit '/links/new'
      fill_in 'url', with: 'http://www.makersacademy.com'
      fill_in 'title', with: 'Makers Academy'

      fill_in 'tags', with: 'education ruby'
      click_button 'Create Link'
      link = Link.first
      expect(link.tags.map(&:name)).to include('education', 'ruby')
    end
  end
