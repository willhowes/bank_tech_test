# Bank Tech Test - Makers Academy Week 10
This is my attempt at the Makers Academy [bank tech test](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md)

## Tech Stack
Language: Ruby
Testing Framework: rspec
Test Coverage: simpleCov
Linter: Rubocop

## Approach
* I used Test Driven Development(TDD) using consistent GREEN-RED-REFACTOR cycles.

* At the outset I did some planning which is in the planning.md file, and this was updated as the program evolved and when I used class extraction.

* Initially the program was built using one class BankAccount. However, as the program became larger, it was apparent that this class was doing too much and breaking the Single Responsibility Principal ('SRP'). Therefore, I used class extraction to break the program into two classes:
- BankTransaction (which has the attributes of a bank transaction, e.g. amount, date, etc)
- BankAccount (which stores a history of transactions and also can also print statement)

* As can be seen from the above the BankAccount class was still clearly breaking SRP as it hand two main functions. Therefore, I used class extraction to break the BankAccount class into two classes, giving a final three classes which you will see in the last commit:

- BankTransaction (as above)
- BankAccount (stores a history of the transactions)
- BankStatement (prints off a statement)

## How to install and run
* Go to your command line/terminal
* Clone this repository
```
git clone git@github.com:willhowes/bank_tech_test.git
```
* Run bundle install
```
bundle install
```
* Run from a ruby repl, such as [PRY](https://github.com/pry/pry)

## How to test
run ```rspec``` in your command line from the root project folder
