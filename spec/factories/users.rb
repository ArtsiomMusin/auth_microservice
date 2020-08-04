FactoryBot.define do
  factory :user do
    name { generate(:name) }
    email { generate(:email) }
    password { 'givemeatoken' }
    password_confirmation { 'givemeatoken' }
  end
end
