At first: 
run the command 'set serveroutput on'
To write the code:
ed 'filename'
(write the code in notepad and save the file in .sql format then close the file)
To run the code:
@'filename'

1.
------------------------------------------------------------------------
CREATE TABLE ACCOUNTS(ACCOUNT_ID NUMBER(4) PRIMARY KEY, BALANCE NUMBER(8,2));
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
	acct_no number(4);
	min_balance number(5,2);
begin
	acct_no := &acct_no;
	min_balance := &min_balance;
	select balance into acct_balance from accounts where account_id = acct_no;
	if acct_balance <= min_balance then
		acct_balance := acct_balance - 100; 
	update accounts set balance = balance - 100 where account_id = acct_no;
	dbms_output.put_line('Account balance now: ' || acct_balance);
	end if;
end;
/
2.
SELECT SUBSTR(ENAME,1,3) "NICKNAME", EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO FROM EMP;

3.
SELECT * FROM (SELECT * FROM EMP ORDER BY SAL) WHERE ROWNUM <= 7;

4.
UPDATE EMP SET COMM = COMM + 0.2 * SAL WHERE EMPNO IN ( SELECT EMPNO FROM EMP WHERE JOB = 'Salesman' AND SAL <= 15000 AND DEPTNO IN ( SELECT DNO FROM DEPT WHERE LOC = 'Chicago' ) );

5.
ALTER TABLE EMP ADD GRADE NUMBER(1);
UPDATE EMP SET GRADE = DBMS_RANDOM.VALUE(1,5);
INSERT INTO EMP VALUES(7992,'Adarsh','Manager',7566,'25-Nov-20',8000,200,40,2);
INSERT INTO EMP VALUES(5448,'Sam','Assistant',7698,'16-Jul-18',10000,100,40,5);

6, 7.
ALTER TABLE EMP ADD SAL_CHANGE DATE;
DECLARE
	CURSOR EMP_CURSOR IS SELECT * FROM EMP;
	HIKE NUMBER(3,2);
BEGIN
	FOR ROW IN EMP_CURSOR
	LOOP
		IF ( ROW.GRADE = 1 ) THEN
			HIKE := 1.15;
		ELSIF ( ROW.GRADE = 2 ) THEN
			HIKE := 1.12;
		ELSIF ( ROW.GRADE = 3 ) THEN
			HIKE := 1.1;
		ELSIF ( ROW.GRADE = 4 ) THEN
			HIKE := 1.1;
		ELSE
			HIKE := 1.05;
		END IF;
		
		UPDATE EMP SET SAL = HIKE * SAL, SAL_CHANGE = SYSDATE;
	END LOOP;
END;
/
