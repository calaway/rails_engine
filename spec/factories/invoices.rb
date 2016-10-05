FactoryGirl.define do
  factory :invoice do
    customer
    merchant
    status "MyString"

    factory :invoice_with_transactions do
      transient do
        transactions_count 5
      end
      after(:create) do |invoice, evaluator|
        create_list(:transaction, evaluator.transactions_count, invoice: invoice)
      end
    end
  end
end
