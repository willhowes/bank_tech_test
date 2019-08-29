# Bank Tech Test - Makers Academy Week 10
This is my attempt at the Makers Academy [bank tech test](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md)

## Tech Stack
```
Language: Ruby
Testing Framework: rspec
Test Coverage: simpleCov
Linter: Rubocop
Tool for freezing time on testing: Timecop
```

## How to install and run
* Go to your command line/terminal
* Clone this repository
```
git clone
```
* Run bundle install
```
bundle install
```

* Go to your terminal and run the following commands
```
git clone git@github.com:willhowes/bank_tech_test.git
cd bank-tech-test
gem install bundler
bundle install
```
* Run from a ruby repl, such as [PRY](https://github.com/pry/pry) or IRB
- In the repl require the Bank Account file
```
require './lib/bank_account.rb'
require './lib/bank_statement.rb'
```
## How to run the tests
run ```rspec``` in your command line from the project folder i.e. (```bank_tech_test```)

## Example interraction in IRB
```
require './lib/bank_account.rb'
 => true
2.6.3 :002 > require './lib/bank_statement.rb'
 => true
2.6.3 :003 > account = BankAccount.new
 => #<BankAccount:0x00007ff78c9e55f8 @transaction_history=[], @current_balance=0>
2.6.3 :004 > statement = BankStatement.new(account)
 => #<BankStatement:0x00007ff78c9f5ac0 @account=#<BankAccount:0x00007ff78c9e55f8 @transaction_history=[], @current_balance=0>>
2.6.3 :005 > account.deposit(1000.00)

 => 1000.0
2.6.3 :006 > account.deposit(2000.00)
 => 3000.0
2.6.3 :007 > account.withdrawal(500.00)
 => 2500.0
2.6.3 :008 > statement.print
 => "date || credit || debit || balance\n29/08/2019 || || 500.00 || 2500.00\n29/08/2019 || 2000.00 || || 3000.00\n29/08/2019 || 1000.00 || || 1000.00"
2.6.3 :009 > puts statement.print
date || credit || debit || balance
29/08/2019 || || 500.00 || 2500.00
29/08/2019 || 2000.00 || || 3000.00
29/08/2019 || 1000.00 || || 1000.00
```

## Approach
* I used Test Driven Development(TDD) using consistent RED-GREEN-REFACTOR cycles.

* At the outset I did some planning which is in the ```planning.md``` file, and this was updated as the program evolved and when I used class extraction.

* Initially the program was built using one class BankAccount. However, as the program became larger, it was apparent that this class was doing too much and breaking the Single Responsibility Principal ('SRP'). Therefore, I used class extraction to break the program into two classes:
- BankTransaction (which has the attributes of a bank transaction, e.g. amount, date, etc)
- BankAccount (which stores a history of transactions and also can also print statement)

* As can be seen from the above the BankAccount class was still clearly breaking SRP as it hand two main functions. Therefore, I used class extraction to break the BankAccount class into two classes, giving three classes:

- BankTransaction (as above)
- BankAccount (stores a history of the transactions)
- BankStatement (prints off a statement)

* Having reviewed my code again, I realised that my BankTransaction class only stored data for an individual transaction it dit not actuall 'do' anything (i.e. it did not have any methods, except private methods for checking the arguments were in the correct format). Therefore, I decided that the BankAccount class could do this job just as well, in fact it was already storing the data for each transaction in the ```transaction_history``` attribute.
* The final commit you will see two classes:

- BankAccount - which records transactions
- BankStatement - which prints of a statement for a given account
