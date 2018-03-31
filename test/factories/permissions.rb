FactoryBot.define do
  factory :permission do
    user_id 1
    name "MyString"
    allow_subject_class "MyString"
    disallow_subject_class 1
    subject_id 1
    action "MyString"
    description "MyText"
  end
end
