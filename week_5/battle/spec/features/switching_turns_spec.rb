feature 'switching turns' do
  context 'Displays currentturn' do
    scenario 'Start of the game' do
      sign_in_and_play
      expect(page).to have_content "Dave's turn"
    end
    scenario 'After player 1 attacks' do
      sign_in_and_play
      click_link 'Attack'
      click_link 'OK'
      expect(page).not_to have_content "Dave's turn"
      expect(page).to have_content "Mittens's turn"
    end
  end
end
