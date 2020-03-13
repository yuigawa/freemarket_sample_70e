FactoryBot.define do
  factory :profile do
    user
    
    family_name                   {"佐藤"}
    first_name                    {"太郎"}
    family_name_kana              {"サトウ"}
    first_name_kana                {"タロウ"}
    birth_year                    {"2001"}
    birth_month                   {"12"}
    birth_day                      {"11"}
  end
end


