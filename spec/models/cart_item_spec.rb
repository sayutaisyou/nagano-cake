require 'rails_helper'

RSpec.describe CatiItem, type: :model do
  context "データが正しく保存される" do
    before do
      @cart_item = CartItem.new
      @cart_item.item_id = "1"
      @cart_item.customer_id = "2"
      @cart_item.amount = "1"
      @cart_item.save
    end
    it "全て入力してあるので保存される" do
      expect(@cart_item).to be_valid
    end
  end
 end