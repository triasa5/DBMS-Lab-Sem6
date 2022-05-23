1.
------------------------------------------------------------------------
CREATE TABLE ACCOUNTS(ACCOUNT_ID NUMBER(4) PRIMARY KEY, BAL NUMBER(8,2));
INSERT INTO ACCOUNTS VALUES(1001, 70000.00);
INSERT INTO ACCOUNTS VALUES(1002, 50000.00);
INSERT INTO ACCOUNTS VALUES(1003, 250.00);
INSERT INTO ACCOUNTS VALUES(1004, 35500.00);
INSERT INTO ACCOUNTS VALUES(1005, 348.00);
INSERT INTO ACCOUNTS VALUES(1006, 15500.00);
-------------------------------------------------------------------------
CODE:
declare
acct_balance number(8,2);
acct_no varchar2(4);
debit_amt number(5):=100;
min_bal constant number(5,2):=500.00;
begin
acct_no := &acct_no;
Select bal into acct_balance from accounts where account_id = acct_no;
if acct_balance <= min_bal then
acct_balance := acct_balance - debit_amt; 
update accounts
set bal = bal - debit_amt where account_id = acct_no;
dbms_output.put_line('Account balance now: ' || acct_balance);
end if;
end;
/
