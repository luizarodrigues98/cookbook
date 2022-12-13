require 'rails_helper'


describe 'Funcionário faz login no sistema' do
  it 'a partir da root_path' do
    user = create(:user)
    
    login_as(user)
    visit root_path
    click_on 'receitas'
    
    expect(page).to have_content('Dashboard') 
    expect(page).to have_content('Suas receitas') 
  end
end