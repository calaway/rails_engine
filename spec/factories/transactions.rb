FactoryGirl.define do
  factory :transaction do
    invoice
    credit_card_number "4580251236515201"
    credit_card_expiration_date "2016-10-03 19:36:30"
    result "sucess"
  end
end
