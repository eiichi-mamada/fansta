require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  let(:team) { create(:team) }
  let(:post) { build(:post, user_id: user.id, team_id: team.id) }

  it 'リクエストが成功すること' do
    get user_url user.id
    expect(response.status).to eq 200
  end

  it 'ユーザー名が表示されていること' do
    get user_url user.id
    expect(response.body).to include user.name
  end

  it 'リクエストが成功すること' do
    get posts_user_url user.id
    expect(response.status).to eq 200
  end
  
  it 'リクエストが成功すること' do
    get followings_user_url user.id
    expect(response.status).to eq 200
  end

  it 'リクエストが成功すること' do
    get fan_teams_user_url user.id
    expect(response.status).to eq 200
  end

end
