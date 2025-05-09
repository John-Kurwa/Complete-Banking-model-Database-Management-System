# Complete-Banking-model-Database-Management-System


## Description
This project implements a relational database schema for a simple banking system using MySQL. It models entities like Client, Accounts, Transactions, Employees, Branches, and Loans, with support for all necessary relationships and constraints.

## Features
- Multiple accounts per customer
- Multiple transactions per account
- Loan management with co-borrower support
- Employee and branch structure

## Setup Instructions
1. Install MySQL on your system.
2. Clone this repository.
3. Import `bank_system.sql` into your MySQL instance:
4. Link for Entity Relationship Diagram (https://dbdiagram.io/d/681de2d35b2fc4582fe7b72c)
```bash
mysql -u your_user -p your_database < bank_system.sql
