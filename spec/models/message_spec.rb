require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:post) { create(:post, user_id: user.id, team_id: team.id) }
  let(:message) { build(:message, user_id: user.id, post_id: post.id) }
  describe 'ユーザー保存のテスト' do
    it "ユーザーが正しく保存される" do
      expect(message).to be_valid
    end
  end
    
  describe 'バリデーションテスト' do
    it "contentが空だと登録できないこと" do
      message = build(:message, content:"")
      expect(message.valid?).to eq false
    end

    it "contentが101字以上だと登録できないこと" do
      message = build(:message, content:"${a*101}")
      expect(message.valid?).to eq false
    end
  end

  describe 'アソシエーションテスト' do
    context 'userモデルとの関係' do
      it '1:1となっている' do
        expect(Message.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'userモデルとの関係' do
      it '1:1となっている' do
        expect(Message.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end
