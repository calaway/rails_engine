# Rails Engine

Rails Engine is a sales engine api platform. This project utilizes Ruby on Rails, ActiveRecord, and SQL to build a JSON API which exposes and serves up data from the sales engine data schema.

## Project Highlights
* Uses single-responsibility controllers to provide a well-designed and versioned API. This is easy to see from the [routes.rb file](https://github.com/calaway/rails_engine/blob/master/config/routes.rb)
* Uses controller tests to drive the design.
* Uses ActiveRecord and SQL to perform complex business inteligence.
* Serves data formatted as JSON utilizing serializers to tailor responses accordingly.
* Uses a custom rake task to load the data into the database.

## Installation & Use
* Clone the project down - `git clone git@github.com:calaway/rails_engine.git`
* Move into the cloned directory
* Create the database and migrate it - `rake db:{create,migrate}`
* Populate the database with data - `rake load:all`
    * If you ever want to load just one type of data you can specify, e.g. `rake load:customers`
* Launch the server
    * By default Rails will run off of localhost:3000
* The api should now be working, all paths begin with `/api/v1`, see the full list of endpoints below.

## API Basic Endpoints
* Merchants
 * `GET /api/v1/merchants/:id/items` returns a collection of items associated with that merchant
 * `GET /api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their known orders
* Invoices
 * `GET /api/v1/invoices/:id/transactions` returns a collection of associated transactions
 * `GET /api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items
 * `GET /api/v1/invoices/:id/items` returns a collection of associated items
 * `GET /api/v1/invoices/:id/customer` returns the associated customer
 * `GET /api/v1/invoices/:id/merchant` returns the associated merchant
* Invoice Items
 * `GET /api/v1/invoice_items/:id/invoice` returns the associated invoice
 * `GET /api/v1/invoice_items/:id/item` returns the associated item
* Items
 * `GET /api/v1/items/:id/invoice_items` returns a collection of associated invoice items
 * `GET /api/v1/items/:id/merchant` returns the associated merchant
* Transactions
 * `GET /api/v1/transactions/:id/invoice` returns the associated invoice
* Customers
 * `GET /api/v1/customers/:id/invoices` returns a collection of associated invoices
 * `GET /api/v1/customers/:id/transactions` returns a collection of associated transactions

 ## API Business Intelligence Endpoints
* All Merchants
 * `GET /api/v1/merchants/most_revenue?quantity=x` returns the top x merchants ranked by total revenue
 * `GET /api/v1/merchants/most_items?quantity=x` returns the top x merchants ranked by total number of items sold
 * `GET /api/v1/merchants/revenue?date=x` returns the total revenue for date x across all merchants
* Single Merchant
 * `GET /api/v1/merchants/:id/revenue` returns the total revenue for that merchant across all transactions
 * `GET /api/v1/merchants/:id/favorite_customer` returns the customer who has conducted the most total number of successful transactions.
 * `GET /api/v1/merchants/:id/customers_with_pending_invoices` returns a collection of customers which have pending (unpaid) invoices
* Items
 * `GET /api/v1/items/most_revenue?quantity=x` returns the top x items ranked by total revenue generated
 * `GET /api/v1/items/most_items?quantity=x` returns the top x item instances ranked by total number sold
* Customers
 * `GET /api/v1/customers/:id/favorite_merchant` returns a merchant where the customer has conducted the most successful transactions


* Version info
    * Ruby - 2.3.0
    * Rails - 5.0.0.1
