FactoryGirl.define do
  factory :transaction do
    invoice
    credit_card_expiration_date "2016-10-03 19:36:30"
    result "MyString"
  end
end
