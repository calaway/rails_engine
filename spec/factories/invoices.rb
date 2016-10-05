FactoryGirl.define do
  factory :invoice do
    customer
    merchant
    status "shipped"

    factory :invoice_with_transactions do
      transient do
        transactions_count 2
      end
      after(:create) do |invoice, evaluator|
        create_list(:transaction, evaluator.transactions_count, invoice: invoice)
      end
    end
  end
end
