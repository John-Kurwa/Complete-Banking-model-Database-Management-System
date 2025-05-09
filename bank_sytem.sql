-- branch table details.
CREATE TABLE Branch_MSTR (
    branch_ID INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) NOT NULL,
    address TEXT NOT NULL,
    city VARCHAR(50) NOT NULL,
    UNIQUE(name)
);    

-- employee table details.
CREATE TABLE Emp_MSTR (
    emp_ID INT AUTO_INCREMENT PRIMARY KEY,
    branch_ID INT,
    firstName varchar(100),
    middleName varchar(100),
    lastName varchar(100),
    dept varchar(100),
    designation varchar(50),
    FOREIGN KEY (branch_ID) REFERENCES Branch_MSTR(branch_ID)
);

-- client table details.
CREATE TABLE Client_MSTR (
    client_ID INT AUTO_INCREMENT PRIMARY KEY,
    firstName varchar(50),
    middleName varchar(50),
    lastName varchar(50),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address TEXT,
    DOB varchar(50)
);    

-- details for the accounts created by clients.
CREATE TABLE Account_MSTR (
    accNo_ID INT AUTO_INCREMENT PRIMARY KEY,
    sf_NO varchar(30),
    lf_NO varchar(30),
    branch_ID INT,
    client_ID INT,
    type varchar(50),
    balance DECIMAL(15,2) DEFAULT 0.00,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (branch_ID) REFERENCES Branch_MSTR(branch_ID) ON DELETE CASCADE,
    FOREIGN KEY (client_ID) REFERENCES Client_MSTR(client_ID) ON DELETE CASCADE
);   

-- details showing transactions. 
CREATE TABLE Trans_MSTR  (
    transaction_ID INT AUTO_INCREMENT PRIMARY KEY,
    accNo_id INT NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    transaction_type ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    dateof_Transaction DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (accNo_ID) REFERENCES Account_MSTR(accNo_ID) ON DELETE CASCADE
);

-- details showing loans structure.
CREATE TABLE Loans_MSTR (
    loan_ID INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(15,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    branch_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (branch_ID) REFERENCES Branch_MSTR(branch_ID)
);

-- Loan payment details.
CREATE TABLE LoanPay_MSTR (
    client_id INT,
    loan_id INT,
    payment_amount DECIMAL(15,2),
    payment_date DATE,
    PRIMARY KEY (customer_ID, loan_ID, payment_date),
    FOREIGN KEY (client_ID) REFERENCES Client_MSTR(client_ID) ON DELETE CASCADE,
    FOREIGN KEY (loan_ID) REFERENCES Loans_MSTR(loan_ID) ON DELETE CASCADE
);

ALTER TABLE LoanPay_MSTR
ADD UNIQUE (client_ID, loan_ID, payment_date);

-- Drop the existing composite primary key.
ALTER TABLE LoanPay_MSTR
DROP PRIMARY KEY;

-- Add the new column and set it as primary key.
ALTER TABLE LoanPay_MSTR
ADD COLUMN LoanPay_ID INT AUTO_INCREMENT PRIMARY KEY;



    
