require 'rails_helper'

RSpec.describe Team, type: :model do
  let(:team) { create(:team) }
  describe 'チーム保存のテスト' do
    it "teamが正しく保存される" do
      expect(team).to be_valid
    end
  end

  describe 'バリデーションテスト' do
    it 'idが空だと登録できないこと' do
      team = build(:team, id:"")
      expect(team.valid?).to eq false
    end

    it 'nameが空だと登録できないこと' do
      team = build(:team, name:"")
      expect(team.valid?).to eq false
    end
  end

  describe 'アソシエーションテスト' do
    context 'postモデルとの関係' do
      it '1:Nとなっている' do
        expect(Team.reflect_on_association(:posts).macro).to eq :has_many
      end
    end

    context 'fan_teamモデルとの関係' do
      it '1:Nとなっている' do
        expect(Team.reflect_on_association(:fan_teams).macro).to eq :has_many
      end
    end

    context 'userモデルとの関係' do
      it '1:Nとなっている' do
        expect(Team.reflect_on_association(:users).macro).to eq :has_many
      end
    end
  end
end
