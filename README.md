# Calculate Sales Tax

An Application to Take list of items in specific format and calculate their sales tax depending upon their category and total amount.

## Application Insights:

* Ruby version - 2.7.2

* Rails version - 6.0

* Test Framework - Rspec

* System dependencies: Linux / Mac.

* Database: Sqlite

* Database Preparation:
	- Sqlite3 comes along with development database.
	- To create a fresh db:
		- rake db:create db:migrate db:seed
	- To drop & create a fresh db:
		- rake db:drop db:create db:migrate db:seed

* How to run the test suite:
	- rails db:migrate RAILS_ENV=test
	- rspec spec/

* How to run Application:
	- rails server

* Input Format: quantity, name, price.
	- Sample:
		```
			Quantity, Product, Price
			1, book, 12.49
			1, music cd, 14.99
			1, chocolate bar, 0.85
		```
