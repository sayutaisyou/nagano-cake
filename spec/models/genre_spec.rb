require 'rails_helper'

RSpec.describe Genre, type: :model do
  context "データが正しく保存される" do
    before do
      @genre = Genre.new
      @genre.name = "ポテトチップス"
      @genre.is_active = "今日も晴れです。"
      @post.save
    end
    it "全て入力してあるので保存される" do
      expect(@post).to be_valid
    end
  end
end