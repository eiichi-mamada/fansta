require 'rails_helper'

RSpec.describe "Toppages", type: :request do
  it 'リクエストが成功すること' do
    get '/'
    expect(response.status).to eq 200
  end
end
