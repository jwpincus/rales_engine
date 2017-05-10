# README

## Goals
This is our Turing School Mod 3-Rails Applications project: the intentions of this project are to master our Rails skills, learn how to build single-responsibility controllers to provide a well-designed and versioned API, practice developing controller tests to drive design, and implement ActiveRecord and SQL query methods to perform complicated business intelligence.

The specifications for the project can be found here: http://backend.turing.io/module3/projects/rails_engine
The original data implemented in the project can be found here: https://github.com/turingschool-examples/sales_engine/tree/master/data
The spec harness for this project can be cloned from here: https://github.com/turingschool/rales_engine_spec_harness

## Setup

1. Clone down repo
2. From repo directory, run the following from the Command Line Interface in sequential order:
    1. `bundle`
    2. `rake nuke`(drops database if one with the same name exists, creates a new database & migrates)
    3. `rake seed:all_data` (this may take several minutes)
    4. `rails server`
    5. `rspec` (optional; runs all rspec tests; to run a singular test, run `rspec spec/<file path>`
3. In order to run the spec harness against the project, clone the rales engine spec harness (linked above), cd into the directory, ensure that the server is running (step 2.iv.) and run `rake` (to run a singular test, run `ruby test/<file path>`

* Ruby version: 2.3.0 (also works with 2.2.5)

* To deploy to heroku from a machine with heroku installed:
1. From repo directory run git push heroku master
2. From repo directory run herkou run rails db:migrate
3. from repo directory run rake seed:all_data


#Endpoints

#### Merchants

* `GET /api/v1/merchants/:id/items` returns a collection of items associated with that merchant
* `GET /api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their known orders

#### Invoices

* `GET /api/v1/invoices/:id/transactions` returns a collection of associated transactions
* `GET /api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/invoices/:id/items` returns a collection of associated items
* `GET /api/v1/invoices/:id/customer` returns the associated customer
* `GET /api/v1/invoices/:id/merchant` returns the associated merchant

#### Invoice Items

* `GET /api/v1/invoice_items/:id/invoice` returns the associated invoice
* `GET /api/v1/invoice_items/:id/item` returns the associated item

#### Items

* `GET /api/v1/items/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/items/:id/merchant` returns the associated merchant

#### Transactions

* `GET /api/v1/transactions/:id/invoice` returns the associated invoice
## Business Intelligence Queries

#### Customers

* `GET /api/v1/customers/:id/invoices` returns a collection of associated invoices
* `GET /api/v1/customers/:id/transactions` returns a collection of associated transactions

#### All Merchants

* `GET /api/v1/merchants/most_revenue?quantity=x` returns the top `x` merchants ranked by total revenue
* `GET /api/v1/merchants/most_items?quantity=x` returns the top `x` merchants ranked by total number of items sold
* `GET /api/v1/merchants/revenue?date=x` returns the total revenue for date `x` across all merchants

Assume the dates provided match the format of a standard ActiveRecord timestamp.

#### Single Merchant

* `GET /api/v1/merchants/:id/revenue` returns the total revenue for that merchant across all transactions
* `GET /api/v1/merchants/:id/revenue?date=x` returns the total revenue for that merchant for a specific invoice date `x`
* `GET /api/v1/merchants/:id/favorite_customer` returns the customer who has conducted the most total number of successful transactions.
* `GET /api/v1/merchants/:id/customers_with_pending_invoices` returns a collection of customers which have pending (unpaid) invoices

_NOTE_: Failed charges should never be counted in revenue totals or statistics.

_NOTE_: All revenues should be reported as a float with two decimal places.

#### Items

* `GET /api/v1/items/most_revenue?quantity=x` returns the top `x` items ranked by total revenue generated
* `GET /api/v1/items/most_items?quantity=x` returns the top `x` item instances ranked by total number sold
* `GET /api/v1/items/:id/best_day` returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, return the most recent day.

#### Customers

* `GET /api/v1/customers/:id/favorite_merchant` returns a merchant where the customer has conducted the most successful transactions
