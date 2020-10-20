require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:post) { build(:post, user_id: user.id, team_id: team.id) }
  describe '投稿保存のテスト' do
    it "投稿が正しく保存される" do
      expect(post).to be_valid
    end
  end

  describe 'バリデーションテスト' do
    it "imageが空だと登録できないこと" do
      post = build(:post, image:"")
      expect(post.valid?).to eq false
    end
  end

  describe 'アソシエーションテスト' do
    context 'userモデルとの関係' do
      it '1:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'userモデルとの関係' do
      it 'favoritesモデルを介してN:Nとなっている' do
        expect(Post.reflect_on_association(:users).macro).to eq :has_many
      end
    end
    
    context 'teamモデルとの関係' do
      it '1:1となっている' do
        expect(Post.reflect_on_association(:team).macro).to eq :belongs_to
      end
    end

    context 'favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'messageモデルとの関係' do
      it '1:Nとなっている' do
        expect(Post.reflect_on_association(:messages).macro).to eq :has_many
      end
    end
  end
end
