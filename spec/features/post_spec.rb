require 'rails_helper'

feature 'post', type: :feature do
  let(:user) { create(:user) }

  scenario 'post' do
    visit root_path
    expect(page).to have_no_content("投稿する")

    visit new_user_session_path
    fill_in 'user_name',with: user.name
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content("投稿する")

    expect {
      click_link('投稿する')
      expect(current_path).to eq new_post_path
      fill_in 'name', with: 'hogehoge'
      fill_in 'text', with: 'hello'
      fill_in 'address', with: 'hogehoge'
      fill_in 'image', with: 'https://s.eximg.jp/expub/feed/Papimami/2016/Papimami_83279/Papimami_83279_1.png'
      find('input[type="submit"]')
    }
  end
end