CREATE TABLE account (
    account_id INT PRIMARY KEY,
    balance DECIMAL(10,2) CHECK (balance >= 0),
    account_type VARCHAR(50) CHECK (account_type IN ('Saving', 'Checking'))
);

ALTER TABLE account DROP CONSTRAINT CK_account_balance;
ALTER TABLE account DROP CONSTRAINT CK_account_type;
ALTER TABLE account ADD CONSTRAINT CK_account_balance CHECK (balance >= 0);
ALTER TABLE account ADD CONSTRAINT CK_account_type CHECK (account_type IN ('Saving', 'Checking'));