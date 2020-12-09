require 'rails_helper'

RSpec.describe "Customers::Homes", type: :request do
  describe '顧客側トップページ' do
    context "トップページが正しく表示される" do
      before do
        get root_path
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'オススメ商品と表示されていること' do
        expect(response.body).to include("オススメ商品")
      end
    end
  end
end


