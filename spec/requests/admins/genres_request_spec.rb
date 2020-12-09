require 'rails_helper'

RSpec.describe "Genres", type: :request do
  describe 'ジャンル一覧画面' do
    context "追加したジャンルが表示されている" do
      before do
        @genre = Genre.new
        @genre = 
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end
end