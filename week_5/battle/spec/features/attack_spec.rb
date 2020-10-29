feature 'Attacking' do
  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'Dave attacked Mittens'
  end
end
