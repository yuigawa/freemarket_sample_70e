FactoryBot.define do
  factory :item_image do
    id {"1"}
    src {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixture/test.jpg'))}
    item_id {"1"}
    created_at {"2000-01-01"}
    updated_at {"2000-01-01"}
  end
end