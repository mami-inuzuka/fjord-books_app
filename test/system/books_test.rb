# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
    @user = users(:alice)
    visit root_url
    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'ログイン後のページを表示する' do
    visit books_url
  end

  test '日報の作成' do
    visit reports_path
    click_link '新規作成'
    fill_in 'タイトル', with: 'タイトルです'
    fill_in '内容', with: '内容です'
    click_button '登録する'
  end

  test '日報の編集' do
    visit report_path(@user.reports.first)
    click_link '編集'
    fill_in 'タイトル', with: '編集後のタイトルです'
    fill_in '内容', with: '編集後の内容です'
    click_button '更新する'
  end

  test '日報の削除' do
    visit reports_path
    click_link '削除', match: :first
  end
end
