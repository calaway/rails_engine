FactoryGirl.define do
  factory :item do
    merchant
    name "MyString"
    description "MyText"
    unit_price 1

    factory :item_with_invoice_items do
      transient do
        invoice_items_count 2
      end
      after(:create) do |item, evaluator|
        create_list(:invoice_item, evaluator.invoice_items_count, item: item)
      end
    end
  end
end
