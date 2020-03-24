FactoryBot.define do
  factory :user_address do
    user
    
    post_code                   {"123-4567"}
    prefecture_code             {"神奈川県"}
    city                        {"横浜市川崎区"}
    house_number                {"青山1-1-1"}
  end
end

