require 'rails_helper'

RSpec.describe "Admins/sessions", type: :request do
  describe 'admins/sessionsページ' do
    context "メールアドレス・パスワードでログインする" do
      before do
        get new_admin_session_path

        fill_in 'admins[password]', with: "aaaaaaaa"
        click_button 'ログイン'
        
      end
      it '管理者トップ画面が表示される' do
        expect(page).to eq (admins_homes_top_path)
      end
    end
  end
end

