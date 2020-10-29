feature 'Attacking' do
  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Dave attacked Mittens'
  end
  scenario 'reduce Player 1 HP by 10' do
    sign_in_and_play
    attack_and_ok
    click_button 'Attack'
    expect(page).to have_content 'Mittens attacked Dave'
  end
end
