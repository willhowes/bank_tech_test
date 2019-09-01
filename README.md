# Bank Tech Test - Makers Academy Week 10
This is my attempt at the [Makers Academy bank tech test](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md)

## Tech Stack
```
Language: Ruby
Testing Framework: rspec
Test Coverage: simpleCov
Linter: Rubocop
Tool for freezing time on testing: Timecop
```

## How to install and run
Go to your terminal and run the following commands
```
git clone git@github.com:willhowes/bank_tech_test.git
cd bank-tech-test
gem install bundler
bundle install
```
Run from a ruby repl, such as PRY or IRB
In the repl require the Bank Account and Bank Statement files
```
require './lib/bank_account.rb'
require './lib/bank_statement.rb'
How to run the tests
run rspec in your command line from the project folder i.e. (bank_tech_test)
```
## Screenshot of example interaction in IRB
<img src="./images/Screenshot 2019-09-01 at 10.04.17.png" width="786" height="522">  

![Screenshot of a terminal running the program]()
1542 × 1046

## Approach
* I used Test Driven Development(TDD) using consistent RED-GREEN-REFACTOR cycles.

* At the outset, I sketched out a domain model which is in the ```planning.md``` file. This was updated as the program evolved and when I used class extraction.

* Initially, the program was built using one class: ```BankAccount```. However, as the program grew, it was apparent that this class was doing too much and breaking the Single Responsibility Principal ('SRP'). Therefore, I used class extraction to break the program into two classes:
1. BankTransaction - which had the attributes of a bank transaction, e.g. amount, date, etc)
2. BankAccount - which stored a history of transactions and printed the statement)

* As can be seen from the above, the BankAccount class was still clearly breaking SRP as it hand two main functions. Therefore, I used class extraction to break the BankAccount class into two classes, giving three in total:

1. BankTransaction (as above)
2. BankAccount (stores a history of the transactions)
3. BankStatement (prints off a statement)

* Having reviewed my code again, I realised that my BankTransaction class only stored data for an individual transaction it dit not actually 'do' anything (i.e. it did not have any methods, except private methods to raise error messages). Therefore, I decided that the BankAccount class could do this job just as well, in fact it was already storing the data for each transaction in the ```transaction_history``` attribute.
* In the final commit you will see two classes:

1. BankAccount - which records transactions
2. BankStatement - which prints of a statement for a given account

## How to contribute
* Clone this repository and submit a pull request
