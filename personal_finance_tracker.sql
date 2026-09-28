CREATE DATABASE personal_finance_tracker;
USE personal_finance_tracker;
SELECT DATABASE();

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at DATE DEFAULT (CURRENT_DATE)
);
SHOW TABLES;

DESC users;

INSERT INTO users (name, email)
VALUES
('Rushikesh', 'rushikesh@gmail.com'),
('Amit', 'amit@gmail.com'),
('Sneha', 'sneha@gmail.com'),
('Priya', 'priya@gmail.com'),
('Rahul', 'rahul@gmail.com');

select * from users;

CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    account_name VARCHAR(100) NOT NULL,
    account_type VARCHAR(50) NOT NULL,
    balance DECIMAL(12,2) DEFAULT 0.00,
    created_at DATE DEFAULT (CURRENT_DATE),
    
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


SHOW TABLES;

DESC accounts;

INSERT INTO accounts
(user_id, account_name, account_type, balance)
VALUES
(1, 'HDFC Bank', 'Bank', 75000.00),
(1, 'Cash', 'Cash', 5000.00),
(1, 'HDFC Credit Card', 'Credit Card', -12000.00),
(2, 'SBI Bank', 'Bank', 60000.00),
(2, 'Cash', 'Cash', 3000.00),
(3, 'ICICI Bank', 'Bank', 85000.00),
(3, 'Google Pay', 'Wallet', 2500.00),
(4, 'Axis Bank', 'Bank', 45000.00),
(4, 'Cash', 'Cash', 4000.00),
(5, 'SBI Bank', 'Bank', 55000.00),
(5, 'Paytm Wallet', 'Wallet', 1500.00);

SELECT * FROM accounts;

CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    category_type ENUM('Income', 'Expense') NOT NULL
);

DESC categories;

INSERT INTO categories (category_name, category_type)
VALUES
('Salary', 'Income'),
('Freelance', 'Income'),
('Business', 'Income'),
('Investment', 'Income'),
('Food', 'Expense'),
('Rent', 'Expense'),
('Transport', 'Expense'),
('Shopping', 'Expense'),
('Entertainment', 'Expense'),
('Bills', 'Expense'),
('Healthcare', 'Expense'),
('Education', 'Expense'),
('Travel', 'Expense'),
('Other', 'Expense');

SELECT * FROM categories;

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    account_id INT NOT NULL,
    category_id INT NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    transaction_date DATE NOT NULL,
    description VARCHAR(255),

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

DESC transactions;

INSERT INTO transactions
(user_id, account_id, category_id, amount, transaction_date, description)
VALUES
(1, 1, 1, 50000.00, '2026-09-01', 'Monthly salary'),
(1, 1, 6, 15000.00, '2026-09-02', 'Monthly house rent'),
(1, 1, 5, 2500.00, '2026-09-04', 'Grocery shopping'),
(1, 2, 7, 800.00, '2026-09-05', 'Office travel'),
(1, 3, 8, 3500.00, '2026-09-07', 'Clothes shopping'),
(1, 3, 9, 1200.00, '2026-09-09', 'Movie and dinner'),
(1, 1, 10, 1800.00, '2026-09-10', 'Electricity bill'),

(2, 4, 1, 60000.00, '2026-09-01', 'Monthly salary'),
(2, 4, 6, 18000.00, '2026-09-02', 'House rent'),
(2, 5, 5, 3000.00, '2026-09-04', 'Groceries'),
(2, 4, 7, 1500.00, '2026-09-06', 'Fuel expense'),

(3, 6, 1, 55000.00, '2026-09-01', 'Monthly salary'),
(3, 7, 5, 2200.00, '2026-09-03', 'Food expense'),
(3, 6, 12, 5000.00, '2026-09-05', 'Online course'),
(3, 7, 13, 4500.00, '2026-09-08', 'Travel booking'),

(4, 8, 1, 48000.00, '2026-09-01', 'Monthly salary'),
(4, 8, 6, 14000.00, '2026-09-02', 'House rent'),
(4, 9, 5, 2800.00, '2026-09-04', 'Grocery shopping'),
(4, 8, 11, 2500.00, '2026-09-07', 'Medical expense'),

(5, 10, 1, 52000.00, '2026-09-01', 'Monthly salary'),
(5, 11, 5, 1800.00, '2026-09-03', 'Food expense'),
(5, 10, 7, 1200.00, '2026-09-05', 'Transportation'),
(5, 11, 9, 1000.00, '2026-09-09', 'Entertainment');

SELECT * FROM transactions;

CREATE TABLE budgets (
    budget_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    category_id INT NOT NULL,
    budget_amount DECIMAL(12,2) NOT NULL,
    budget_month DATE NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
DESC budgets;

INSERT INTO budgets
(user_id, category_id, budget_amount, budget_month)
VALUES
(1, 5, 5000.00, '2026-09-01'),
(1, 6, 15000.00, '2026-09-01'),
(1, 7, 3000.00, '2026-09-01'),
(1, 8, 5000.00, '2026-09-01'),
(1, 9, 3000.00, '2026-09-01'),
(1, 10, 2500.00, '2026-09-01'),

(2, 5, 5000.00, '2026-09-01'),
(2, 6, 18000.00, '2026-09-01'),
(2, 7, 4000.00, '2026-09-01'),

(3, 5, 5000.00, '2026-09-01'),
(3, 12, 6000.00, '2026-09-01'),
(3, 13, 7000.00, '2026-09-01'),

(4, 5, 5000.00, '2026-09-01'),
(4, 6, 14000.00, '2026-09-01'),
(4, 11, 5000.00, '2026-09-01'),

(5, 5, 4000.00, '2026-09-01'),
(5, 7, 3000.00, '2026-09-01'),
(5, 9, 2500.00, '2026-09-01');

SELECT * FROM budgets;

SELECT *
FROM users;

SELECT user_id, name, email
FROM users;

SELECT *
FROM users
WHERE name = 'Rushikesh';

SELECT *
FROM transactions;

SELECT 
    t.transaction_id,
    t.user_id,
    c.category_name,
    c.category_type,
    t.amount,
    t.transaction_date,
    t.description
FROM transactions t
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Expense';

SELECT 
    t.transaction_id,
    t.user_id,
    c.category_name,
    c.category_type,
    t.amount,
    t.transaction_date,
    t.description
FROM transactions t
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Income';

SELECT SUM(t.amount) AS total_income
FROM transactions t
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Income';

SELECT SUM(t.amount) AS total_expense
FROM transactions t
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Expense';

SELECT 
    u.name,
    t.transaction_id,
    c.category_name,
    c.category_type,
    t.amount,
    t.transaction_date,
    t.description
FROM users u
JOIN transactions t
    ON u.user_id = t.user_id
JOIN categories c
    ON t.category_id = c.category_id;
    
SELECT 
    u.name,
    SUM(t.amount) AS total_income
FROM users u
JOIN transactions t
    ON u.user_id = t.user_id
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Income'
GROUP BY u.user_id, u.name;    

SELECT 
    u.name,
    SUM(t.amount) AS total_expense
FROM users u
JOIN transactions t
    ON u.user_id = t.user_id
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
GROUP BY u.user_id, u.name;

SELECT 
    u.name,
    SUM(
        CASE 
            WHEN c.category_type = 'Income'
            THEN t.amount
            ELSE 0
        END
    ) AS total_income,

    SUM(
        CASE 
            WHEN c.category_type = 'Expense'
            THEN t.amount
            ELSE 0
        END
    ) AS total_expense

FROM users u
JOIN transactions t
    ON u.user_id = t.user_id
JOIN categories c
    ON t.category_id = c.category_id

GROUP BY u.user_id, u.name;

SELECT 
    u.name,

    SUM(
        CASE 
            WHEN c.category_type = 'Income'
            THEN t.amount
            ELSE 0
        END
    ) AS total_income,

    SUM(
        CASE 
            WHEN c.category_type = 'Expense'
            THEN t.amount
            ELSE 0
        END
    ) AS total_expense,

    SUM(
        CASE 
            WHEN c.category_type = 'Income'
            THEN t.amount
            WHEN c.category_type = 'Expense'
            THEN -t.amount
            ELSE 0
        END
    ) AS savings

FROM users u
JOIN transactions t
    ON u.user_id = t.user_id
JOIN categories c
    ON t.category_id = c.category_id

GROUP BY u.user_id, u.name;

SELECT 
    c.category_name,
    SUM(t.amount) AS total_spent
FROM transactions t
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
GROUP BY c.category_id, c.category_name
ORDER BY total_spent DESC;

SELECT 
    c.category_name,
    SUM(t.amount) AS total_spent
FROM transactions t
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
GROUP BY c.category_id, c.category_name
ORDER BY total_spent DESC
LIMIT 1;

SELECT 
    u.name,
    SUM(t.amount) AS total_expense
FROM users u
JOIN transactions t
    ON u.user_id = t.user_id
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
GROUP BY u.user_id, u.name
HAVING SUM(t.amount) > 20000;

SELECT *
FROM transactions
WHERE amount > (
    SELECT AVG(amount)
    FROM transactions
);

SELECT *
FROM transactions
WHERE amount = (
    SELECT MAX(amount)
    FROM transactions
);

SELECT MAX(amount) AS second_highest
FROM transactions
WHERE amount < (
    SELECT MAX(amount)
    FROM transactions
);


SELECT 
    u.name,
    SUM(t.amount) AS total_expense
FROM users u
JOIN transactions t
    ON u.user_id = t.user_id
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
GROUP BY u.user_id, u.name
HAVING SUM(t.amount) > (
    SELECT AVG(user_expense)
    FROM (
        SELECT 
            user_id,
            SUM(amount) AS user_expense
        FROM transactions t
        JOIN categories c
            ON t.category_id = c.category_id
        WHERE c.category_type = 'Expense'
        GROUP BY user_id
    ) AS expense_summary
);


SELECT 
    u.name,
    SUM(t.amount) AS total_expense
FROM users u
JOIN transactions t
    ON u.user_id = t.user_id
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
GROUP BY u.user_id, u.name
ORDER BY total_expense DESC
LIMIT 1;

SELECT 
    u.name,
    SUM(t.amount) AS total_expense
FROM users u
JOIN transactions t
    ON u.user_id = t.user_id
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
GROUP BY u.user_id, u.name
HAVING SUM(t.amount) = (
    SELECT MAX(total_expense)
    FROM (
        SELECT 
            user_id,
            SUM(amount) AS total_expense
        FROM transactions t
        JOIN categories c
            ON t.category_id = c.category_id
        WHERE c.category_type = 'Expense'
        GROUP BY user_id
    ) AS expense_summary
);

SELECT category_name
FROM categories
WHERE category_id IN (
    SELECT DISTINCT category_id
    FROM transactions
);

SELECT category_name
FROM categories
WHERE category_id NOT IN (
    SELECT DISTINCT category_id
    FROM transactions
);

SELECT name
FROM users
WHERE user_id IN (
    SELECT DISTINCT user_id
    FROM transactions
);


USE personal_finance_tracker;

-- =========================================================
-- PART 3: CTE (COMMON TABLE EXPRESSIONS)
-- =========================================================

-- Q1. Calculate total income and expense for each user using CTE

WITH user_finance AS (
    SELECT
        t.user_id,
        SUM(
            CASE
                WHEN c.category_type = 'Income' THEN t.amount
                ELSE 0
            END
        ) AS total_income,
        SUM(
            CASE
                WHEN c.category_type = 'Expense' THEN t.amount
                ELSE 0
            END
        ) AS total_expense
    FROM transactions t
    JOIN categories c
        ON t.category_id = c.category_id
    GROUP BY t.user_id
)
SELECT
    u.name,
    uf.total_income,
    uf.total_expense,
    uf.total_income - uf.total_expense AS savings
FROM users u
JOIN user_finance uf
    ON u.user_id = uf.user_id;


-- Q2. Find users whose expense is greater than average expense

WITH user_expense AS (
    SELECT
        user_id,
        SUM(t.amount) AS total_expense
    FROM transactions t
    JOIN categories c
        ON t.category_id = c.category_id
    WHERE c.category_type = 'Expense'
    GROUP BY user_id
)
SELECT
    u.name,
    ue.total_expense
FROM users u
JOIN user_expense ue
    ON u.user_id = ue.user_id
WHERE ue.total_expense > (
    SELECT AVG(total_expense)
    FROM user_expense
);


-- Q3. Find total spending by category using CTE

WITH category_expense AS (
    SELECT
        c.category_name,
        SUM(t.amount) AS total_expense
    FROM transactions t
    JOIN categories c
        ON t.category_id = c.category_id
    WHERE c.category_type = 'Expense'
    GROUP BY c.category_id, c.category_name
)
SELECT *
FROM category_expense
ORDER BY total_expense DESC;


-- =========================================================
-- PART 4: WINDOW FUNCTIONS
-- =========================================================

-- Q4. Rank users according to their total expense

WITH user_expense AS (
    SELECT
        user_id,
        SUM(t.amount) AS total_expense
    FROM transactions t
    JOIN categories c
        ON t.category_id = c.category_id
    WHERE c.category_type = 'Expense'
    GROUP BY user_id
)
SELECT
    u.name,
    ue.total_expense,
    RANK() OVER (ORDER BY ue.total_expense DESC) AS expense_rank
FROM users u
JOIN user_expense ue
    ON u.user_id = ue.user_id;


-- Q5. Dense rank users according to expense

WITH user_expense AS (
    SELECT
        user_id,
        SUM(t.amount) AS total_expense
    FROM transactions t
    JOIN categories c
        ON t.category_id = c.category_id
    WHERE c.category_type = 'Expense'
    GROUP BY user_id
)
SELECT
    u.name,
    ue.total_expense,
    DENSE_RANK() OVER (ORDER BY ue.total_expense DESC) AS expense_rank
FROM users u
JOIN user_expense ue
    ON u.user_id = ue.user_id;


-- Q6. Rank transactions for each user

SELECT
    t.user_id,
    u.name,
    t.transaction_id,
    t.amount,
    t.transaction_date,
    RANK() OVER (
        PARTITION BY t.user_id
        ORDER BY t.amount DESC
    ) AS transaction_rank
FROM transactions t
JOIN users u
    ON t.user_id = u.user_id;


-- Q7. Running total of transactions for each user

SELECT
    t.user_id,
    u.name,
    t.transaction_date,
    t.amount,
    SUM(t.amount) OVER (
        PARTITION BY t.user_id
        ORDER BY t.transaction_date
    ) AS running_total
FROM transactions t
JOIN users u
    ON t.user_id = u.user_id;


-- =========================================================
-- PART 5: CASE STATEMENT
-- =========================================================

-- Q8. Classify transactions as Low, Medium or High

SELECT
    transaction_id,
    user_id,
    amount,
    CASE
        WHEN amount < 2000 THEN 'Low'
        WHEN amount BETWEEN 2000 AND 10000 THEN 'Medium'
        ELSE 'High'
    END AS transaction_level
FROM transactions;


-- Q9. Display Income and Expense using CASE

SELECT
    transaction_id,
    amount,
    CASE
        WHEN c.category_type = 'Income' THEN 'Money Received'
        WHEN c.category_type = 'Expense' THEN 'Money Spent'
    END AS transaction_status
FROM transactions t
JOIN categories c
    ON t.category_id = c.category_id;


-- =========================================================
-- PART 6: BUDGET ANALYSIS
-- =========================================================

-- Q10. Compare budget with actual spending

SELECT
    u.name,
    c.category_name,
    b.budget_amount,
    COALESCE(SUM(t.amount), 0) AS actual_spending,
    b.budget_amount - COALESCE(SUM(t.amount), 0) AS remaining_budget
FROM budgets b
JOIN users u
    ON b.user_id = u.user_id
JOIN categories c
    ON b.category_id = c.category_id
LEFT JOIN transactions t
    ON b.user_id = t.user_id
    AND b.category_id = t.category_id
    AND t.transaction_date >= b.budget_month
    AND t.transaction_date < DATE_ADD(b.budget_month, INTERVAL 1 MONTH)
GROUP BY
    b.budget_id,
    u.name,
    c.category_name,
    b.budget_amount
ORDER BY u.name, c.category_name;


-- Q11. Check whether users exceeded their budget

SELECT
    u.name,
    c.category_name,
    b.budget_amount,
    COALESCE(SUM(t.amount), 0) AS actual_spending,
    CASE
        WHEN COALESCE(SUM(t.amount), 0) > b.budget_amount
            THEN 'Budget Exceeded'
        WHEN COALESCE(SUM(t.amount), 0) = b.budget_amount
            THEN 'Budget Fully Used'
        ELSE 'Within Budget'
    END AS budget_status
FROM budgets b
JOIN users u
    ON b.user_id = u.user_id
JOIN categories c
    ON b.category_id = c.category_id
LEFT JOIN transactions t
    ON b.user_id = t.user_id
    AND b.category_id = t.category_id
    AND t.transaction_date >= b.budget_month
    AND t.transaction_date < DATE_ADD(b.budget_month, INTERVAL 1 MONTH)
GROUP BY
    b.budget_id,
    u.name,
    c.category_name,
    b.budget_amount;


-- Q12. Calculate budget utilization percentage

SELECT
    u.name,
    c.category_name,
    b.budget_amount,
    COALESCE(SUM(t.amount), 0) AS actual_spending,
    ROUND(
        COALESCE(SUM(t.amount), 0) / b.budget_amount * 100,
        2
    ) AS budget_used_percentage
FROM budgets b
JOIN users u
    ON b.user_id = u.user_id
JOIN categories c
    ON b.category_id = c.category_id
LEFT JOIN transactions t
    ON b.user_id = t.user_id
    AND b.category_id = t.category_id
    AND t.transaction_date >= b.budget_month
    AND t.transaction_date < DATE_ADD(b.budget_month, INTERVAL 1 MONTH)
GROUP BY
    b.budget_id,
    u.name,
    c.category_name,
    b.budget_amount;


-- =========================================================
-- PART 7: VIEWS
-- =========================================================

-- Q13. Create a transaction details view

CREATE OR REPLACE VIEW transaction_details AS
SELECT
    t.transaction_id,
    u.name AS user_name,
    a.account_name,
    a.account_type,
    c.category_name,
    c.category_type,
    t.amount,
    t.transaction_date,
    t.description
FROM transactions t
JOIN users u
    ON t.user_id = u.user_id
JOIN accounts a
    ON t.account_id = a.account_id
JOIN categories c
    ON t.category_id = c.category_id;


-- View data

SELECT *
FROM transaction_details;


-- Q14. Create user financial summary view

CREATE OR REPLACE VIEW user_financial_summary AS
SELECT
    u.user_id,
    u.name,
    SUM(
        CASE
            WHEN c.category_type = 'Income'
            THEN t.amount
            ELSE 0
        END
    ) AS total_income,
    SUM(
        CASE
            WHEN c.category_type = 'Expense'
            THEN t.amount
            ELSE 0
        END
    ) AS total_expense,
    SUM(
        CASE
            WHEN c.category_type = 'Income'
            THEN t.amount
            WHEN c.category_type = 'Expense'
            THEN -t.amount
            ELSE 0
        END
    ) AS savings
FROM users u
JOIN transactions t
    ON u.user_id = t.user_id
JOIN categories c
    ON t.category_id = c.category_id
GROUP BY u.user_id, u.name;


-- View data

SELECT *
FROM user_financial_summary;


-- =========================================================
-- PART 8: STORED PROCEDURE
-- =========================================================

-- Q15. Procedure to get transactions of a particular user

DELIMITER //

CREATE PROCEDURE GetUserTransactions(IN p_user_id INT)
BEGIN

    SELECT
        t.transaction_id,
        u.name,
        c.category_name,
        c.category_type,
        t.amount,
        t.transaction_date,
        t.description
    FROM transactions t
    JOIN users u
        ON t.user_id = u.user_id
    JOIN categories c
        ON t.category_id = c.category_id
    WHERE t.user_id = p_user_id;

END //

DELIMITER ;


-- Execute procedure

CALL GetUserTransactions(1);


-- =========================================================
-- PART 9: STORED PROCEDURE FOR FINANCIAL SUMMARY
-- =========================================================

DELIMITER //

CREATE PROCEDURE GetFinancialSummary(IN p_user_id INT)
BEGIN

    SELECT
        u.name,

        SUM(
            CASE
                WHEN c.category_type = 'Income'
                THEN t.amount
                ELSE 0
            END
        ) AS total_income,

        SUM(
            CASE
                WHEN c.category_type = 'Expense'
                THEN t.amount
                ELSE 0
            END
        ) AS total_expense,

        SUM(
            CASE
                WHEN c.category_type = 'Income'
                THEN t.amount
                WHEN c.category_type = 'Expense'
                THEN -t.amount
                ELSE 0
            END
        ) AS savings

    FROM users u
    JOIN transactions t
        ON u.user_id = t.user_id
    JOIN categories c
        ON t.category_id = c.category_id
    WHERE u.user_id = p_user_id
    GROUP BY u.user_id, u.name;

END //

DELIMITER ;


-- Execute

CALL GetFinancialSummary(1);


-- =========================================================
-- PART 10: TRIGGER
-- =========================================================

-- Trigger to prevent negative transaction amounts

DELIMITER //

CREATE TRIGGER prevent_negative_transaction
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN

    IF NEW.amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Transaction amount must be greater than zero';
    END IF;

END //

DELIMITER ;


-- Test trigger
-- This should generate an error:

-- INSERT INTO transactions
-- (user_id, account_id, category_id, amount, transaction_date, description)
-- VALUES
-- (1, 1, 5, -1000, '2026-09-20', 'Invalid transaction');


-- =========================================================
-- PART 11: FINAL ANALYTICAL QUERIES
-- =========================================================

-- Q16. Total income

SELECT
    SUM(t.amount) AS total_income
FROM transactions t
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Income';


-- Q17. Total expense

SELECT
    SUM(t.amount) AS total_expense
FROM transactions t
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Expense';


-- Q18. Overall savings

SELECT
    SUM(
        CASE
            WHEN c.category_type = 'Income'
                THEN t.amount
            WHEN c.category_type = 'Expense'
                THEN -t.amount
        END
    ) AS total_savings
FROM transactions t
JOIN categories c
    ON t.category_id = c.category_id;


-- Q19. Highest expense transaction

SELECT
    t.transaction_id,
    u.name,
    c.category_name,
    t.amount,
    t.transaction_date,
    t.description
FROM transactions t
JOIN users u
    ON t.user_id = u.user_id
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
ORDER BY t.amount DESC
LIMIT 1;


-- Q20. Highest spending category

SELECT
    c.category_name,
    SUM(t.amount) AS total_spending
FROM transactions t
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
GROUP BY c.category_id, c.category_name
ORDER BY total_spending DESC
LIMIT 1;


-- Q21. User with highest savings

SELECT
    name,
    total_income,
    total_expense,
    savings
FROM user_financial_summary
ORDER BY savings DESC
LIMIT 1;


-- Q22. User with highest expense

SELECT
    name,
    total_expense
FROM user_financial_summary
ORDER BY total_expense DESC
LIMIT 1;


-- Q23. Monthly income and expense

SELECT
    DATE_FORMAT(t.transaction_date, '%Y-%m') AS month,
    SUM(
        CASE
            WHEN c.category_type = 'Income'
            THEN t.amount
            ELSE 0
        END
    ) AS income,
    SUM(
        CASE
            WHEN c.category_type = 'Expense'
            THEN t.amount
            ELSE 0
        END
    ) AS expense
FROM transactions t
JOIN categories c
    ON t.category_id = c.category_id
GROUP BY DATE_FORMAT(t.transaction_date, '%Y-%m');


-- Q24. Expense percentage by category

SELECT
    c.category_name,
    SUM(t.amount) AS category_expense,
    ROUND(
        SUM(t.amount) * 100 /
        (
            SELECT SUM(amount)
            FROM transactions t2
            JOIN categories c2
                ON t2.category_id = c2.category_id
            WHERE c2.category_type = 'Expense'
        ),
        2
    ) AS expense_percentage
FROM transactions t
JOIN categories c
    ON t.category_id = c.category_id
WHERE c.category_type = 'Expense'
GROUP BY c.category_id, c.category_name
ORDER BY expense_percentage DESC;


-- Q25. Number of transactions per user

SELECT
    u.name,
    COUNT(t.transaction_id) AS total_transactions
FROM users u
LEFT JOIN transactions t
    ON u.user_id = t.user_id
GROUP BY u.user_id, u.name
ORDER BY total_transactions DESC;


-- =========================================================
-- PROJECT CHECK
-- =========================================================

SHOW TABLES;

SELECT * FROM users;
SELECT * FROM accounts;
SELECT * FROM categories;
SELECT * FROM transactions;
SELECT * FROM budgets;

SELECT * FROM transaction_details;
SELECT * FROM user_financial_summary;