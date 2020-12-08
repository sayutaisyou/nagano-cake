require 'rails_helper'

RSpec.describe "customers/CartItems", type: :request do
  describe 'カート画面' do
    context "トップ画面に遷移する" do
      before do
        get root_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      # it 'タイトルが正しく表示されていること' do
      #   expect(response.body).to include("新規投稿")
      # end
    end
  end
end