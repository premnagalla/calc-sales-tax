# Calculate Sales Tax

An Application to Take list of items in specific format and calculate their sales tax depending upon their category and total amount.

## Application Insights:

* Ruby version - 2.7.2

* Rails version - 6.0

* Test Framework - Rspec

* System dependencies: Linux / Mac.

* Database: Sqlite

* Database Preparation:
	- To create a fresh db:
		- rake db:create db:migrate db:seed
	- To drop existing & create a fresh db:
		- rake db:drop db:create db:migrate db:seed

* Application Setup and running:
	- rails db:create db:migrate db:seed
	- rails server

* How to run the test suite:
	- rails db:migrate RAILS_ENV=test
	- rspec spec/

* Input Format: quantity, name, price.
	- Sample:
		```
			Quantity, Product, Price
			1, book, 12.49
			1, music cd, 14.99
			1, chocolate bar, 0.85
		```
* Tax Calulation Rules
	- books, food, and medical items - 0%
	- All Other Items - 10%
	- All Imported items, including books, food, and medical items - 5%
	- Items Price includes Sales tax
	- Sales tax is rounded to 0.05
	- User can choose the words and tax percentage for each category by updating `keywords` & `tax percentage` in `Categories` table.
