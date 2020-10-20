require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  describe 'ユーザー保存のテスト' do
    it "ユーザーが正しく保存される" do
      expect(user).to be_valid
    end
  end
    
  describe 'バリデーションテスト' do
    # 1. nameが空だと登録できないこと
    it "nameが空だと登録できないこと" do
      user = build(:user, name:"")
      user.valid?
      expect(user.errors[:name]).to include("がありません")
    end

    # 2.nameが21字以上だと登録できないこと
    it "nameが21字以上だと登録できないこと" do
      user = build(:user, name:"123456789012345678901")
      user.valid?
      expect(user.errors[:name]).to include("は20文字以内で入力してください")
    end

    # 4. emailが空だと登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("がありません")
    end

    # 5. emailの@がないと登録できないこと
    it "is invalid without a email of @" do
      user = build(:user, email: "eeegmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordが空だと登録できないこと" do
      user = build(:user,password:"")
      expect(user.valid?).to eq false
    end
  end

  describe 'アソシエーションテスト' do
    context 'postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end

    context 'relaationshipモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:relationships).macro).to eq :has_many
      end
    end

    context 'followingモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:followings).macro).to eq :has_many
      end
    end
    
    context 'favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
    end

    context 'favorites_postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:favorites_posts).macro).to eq :has_many
      end
    end

    context 'fan_teamモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:fan_teams).macro).to eq :has_many
      end
    end

    context 'teamモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:teams).macro).to eq :has_many
      end
    end

    context 'messageモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:messages).macro).to eq :has_many
      end
    end
  end
end
