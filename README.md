# 💰 Personal Finance Tracker — SQL Project

A relational **Personal Finance Tracker** built using **MySQL** to manage users, financial accounts, income, expenses, categories, and monthly budgets.

This project demonstrates practical SQL skills including **JOINs, GROUP BY, HAVING, Subqueries, CTEs, CASE statements, Window Functions, Views, Stored Procedures, and Triggers**.

---

## 📌 Project Overview

The Personal Finance Tracker is designed to store and analyze personal financial data.

The database allows us to:

- Track income and expenses
- Manage multiple financial accounts
- Categorize transactions
- Calculate total income and expenses
- Calculate user savings
- Analyze spending by category
- Compare budgets with actual spending
- Identify high-value transactions
- Rank users based on expenses
- Generate reusable financial summaries
- Validate transaction data

---

## 🎯 Project Objectives

- Design a relational database for personal finance management
- Maintain relationships between users, accounts, transactions, categories, and budgets
- Track income and expenses using structured transaction records
- Calculate total income, expenses, and savings
- Analyze spending patterns by category
- Compare monthly budgets with actual spending
- Apply advanced SQL concepts for data analysis
- Create reusable database objects
- Implement data validation using triggers

---

## 🗄️ Database Structure

The project contains **5 main tables**:

### 1. Users

Stores information about users.

| Column | Description |
|---|---|
| `user_id` | Primary Key |
| `name` | User name |
| `email` | Unique email |
| `created_at` | Account creation date |

---

### 2. Accounts

Stores users' financial accounts.

Examples:

- Bank Account
- Cash
- Credit Card
- Wallet

| Column | Description |
|---|---|
| `account_id` | Primary Key |
| `user_id` | Foreign Key |
| `account_name` | Account name |
| `account_type` | Type of account |
| `balance` | Account balance |
| `created_at` | Account creation date |

---

### 3. Categories

Stores income and expense categories.

Examples:

**Income**
- Salary
- Freelance
- Business
- Investment

**Expense**
- Food
- Rent
- Transport
- Shopping
- Entertainment
- Bills
- Healthcare
- Education
- Travel
- Other

| Column | Description |
|---|---|
| `category_id` | Primary Key |
| `category_name` | Category name |
| `category_type` | Income / Expense |

---

### 4. Transactions

Stores all financial transactions.

| Column | Description |
|---|---|
| `transaction_id` | Primary Key |
| `user_id` | Foreign Key |
| `account_id` | Foreign Key |
| `category_id` | Foreign Key |
| `amount` | Transaction amount |
| `transaction_date` | Transaction date |
| `description` | Transaction description |

---

### 5. Budgets

Stores monthly category-level budgets.

| Column | Description |
|---|---|
| `budget_id` | Primary Key |
| `user_id` | Foreign Key |
| `category_id` | Foreign Key |
| `budget_amount` | Budget amount |
| `budget_month` | Budget month |

---

## 🔗 Database Relationships

```text
                    USERS
                      |
          ┌───────────┼───────────┐
          ↓           ↓           ↓
      ACCOUNTS   TRANSACTIONS   BUDGETS
                     |
                ┌────┴────┐
                ↓         ↓
           CATEGORIES   ACCOUNTS
