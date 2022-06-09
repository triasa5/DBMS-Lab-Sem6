At first: 
run the command 'set serveroutput on'
To write the code:
ed 'filename'
(write the code in notepad and save the file in .sql format then close the file)
To run the code:
@'filename'

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
/* OR */
DECLARE
	I NUMBER;
BEGIN
	I := 1;
	WHILE I != 100 LOOP
		INSERT INTO BANK_ACCOUNTS VALUES(1000+I,ROUND(DBMS_RANDOM.VALUE(1000,100000),3));
		I := I + 1;
	END LOOP;
END;
/

PL/SQL CODE:
-----------
declare
acct_balance number(8,2);
acct_no varchar2(4);
min_bal constant number(5,2);
begin
acct_no := &acct_no;
min_bal := &min_bal;
Select bal into acct_balance from accounts where account_id = acct_no;
if acct_balance <= min_bal then
acct_balance := acct_balance - 100; 
update accounts set bal = bal - 100 where account_id = acct_no;
dbms_output.put_line('Account balance now: ' || acct_balance);
end if;
end;
/
