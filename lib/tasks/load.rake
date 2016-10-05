require 'csv'

namespace :load do
  desc "Load all merchants, customers, items, invoices, transactions, and invoice_items into the database"
  task all: [:merchants,
             :customers,
             :items,
             :invoices,
             :transactions,
             :invoice_items]

  desc "Load all items into the database"
  task items: :environment do
    CSV.foreach('./data/items.csv', headers: true) do |row|
      Item.create(row.to_h)
    end
    puts "#{Item.count} items have been loaded."
  end

  desc "Load all invoices into the database"
  task invoices: :environment do
    CSV.foreach('./data/invoices.csv', headers: true) do |row|
      Invoice.create(row.to_h)
    end
    puts "#{Invoice.count} invoices have been loaded."
  end

  desc "Load all invoice_items into the database"
  task invoice_items: :environment do
    CSV.foreach('./data/invoice_items.csv', headers: true) do |row|
      InvoiceItem.create(row.to_h)
    end
    puts "#{InvoiceItem.count} invoice items have been loaded."
  end

  desc "Load all merchants into the database"
  task merchants: :environment do
    CSV.foreach('./data/merchants.csv', headers: true) do |row|
      Merchant.create(row.to_h)
    end
    puts "#{Merchant.count} merchants have been loaded."
  end

  desc "Load all transactions into the database"
  task transactions: :environment do
    CSV.foreach('./data/transactions.csv', headers: true) do |row|
      Transaction.create(row.to_h)
    end
    puts "#{Transaction.count} transactions have been loaded."
  end

  desc "Load all customers into the database"
  task customers: :environment do
    CSV.foreach('./data/customers.csv', headers: true) do |row|
      Customer.create(row.to_h)
    end
    puts "#{Customer.count} customers have been loaded."
  end
end
