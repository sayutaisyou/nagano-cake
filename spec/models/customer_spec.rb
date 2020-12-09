require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "データが正しく保存される" do
    before do
      @customer = Customer.new
      @customer.last_name = "山田"
      @customer.first_name = "一郎"
      @customer.last_name_kana = "ヤマダ"
      @customer.first_name_kana = "イチロウ"
      @customer.email = "test@gmail.com"
      @customer.password = "password"
      @customer.postal_code = "0000000"
      @customer.address = "東京都新宿区"
      @customer.telephone_number = "00000000000"
      @customer.save
    end
    it "全て入力してあるので保存される" do
      expect(@customer).to be_valid
    end

    context "データが正しく保存されない" do
      before do
        @customer = Customer.new
        @customer.last_name = "山田"
        @customer.first_name = ""
        @customer.last_name_kana = "ヤマダ"
        @customer.first_name_kana = "イチロウ"
        @customer.email = "test@gmail.com"
        @customer.password = "password"
        @customer.postal_code = "0000000"
        @customer.address = "東京都新宿区"
        @customer.telephone_number = "00000000000"
        @customer.save
      end
      it "first_nameが入力されていないので保存されない" do
        expect(@customer).to be_invalid
        expect(@customer.errors[:first_name]).to include("can't be blank")
      end
    end

  end
end
