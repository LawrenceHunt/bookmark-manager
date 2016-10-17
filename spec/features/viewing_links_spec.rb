require 'spec_helper'

# As a web user,
# So I can get ideas for the best of the web,
# I'd like to see a list of top links.

feature 'Viewing links' do
  scenario 'I can see existing links on the links page' do
    Link.create(url: 'http://makersacademy.com', title: 'Makers Academy')
    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
