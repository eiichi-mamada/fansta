FactoryBot.define do
  factory :post do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpeg')) }
    coment { "coment" }
  end
end
