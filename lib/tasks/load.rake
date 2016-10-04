require 'csv'

namespace :load do
  desc "TODO"
  task items: :environment do
    CSV.foreach('./data/items.csv', headers: true) do |row|
      Item.create(row.to_h)
    end
  end

  desc "TODO"
  task invoices: :environment do
    CSV.foreach('./data/merchants.csv', headers: true) do |row|
      Invoice.create(row.to_h)
    end
  end

  desc "TODO"
  task invoice_items: :environment do
    CSV.foreach('./data/merchants.csv', headers: true) do |row|
      InvoiceItem.create(row.to_h)
    end
  end

  desc "TODO"
  task merchants: :environment do
    CSV.foreach('./data/merchants.csv', headers: true) do |row|
      Merchant.create(row.to_h)
    end
  end

  desc "TODO"
  task transactions: :environment do
    CSV.foreach('./data/merchants.csv', headers: true) do |row|
      Transaction.create(row.to_h)
    end
  end

  desc "TODO"
  task customers: :environment do
    CSV.foreach('./data/merchants.csv', headers: true) do |row|
      Customer.create(row.to_h)
    end
  end

end
