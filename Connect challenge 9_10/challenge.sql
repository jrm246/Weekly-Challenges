CREATE TABLE WORKER (
    WORKER_ID int PRIMARY KEY,
    FIRST_NAME VARCHAR(25),
    LAST_NAME VARCHAR(25),
    SALARY int,
    JOINING_DATE DATETIME,
    DEPARTMENT VARCHAR(25)
);

CREATE TABLE BONUS (
    WORKER_REF_ID int,
    BONUS_DATE DATETIME,
    BONUS_AMOUNT INT,
    FOREIGN KEY(WORKER_REF_ID) REFERENCES WORKER(WORKER_ID)
);

CREATE TABLE TITLE (
    WORKER_REF_ID int,
    WORKER_TITLE VARCHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY(WORKER_REF_ID) REFERENCES WORKER(WORKER_ID)
);

INSERT INTO WORKER (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES (1, 'Rick', 'Smith', 100000, '2021-02-20 9:00:00', 'HR'),
(2, 'Sam', 'Williams', 80000, '2021-06-11 09:00:00', 'Admin'),
(3, 'John', 'Brown', 300000, '2021-02-20 09:00:00', 'HR'),
(4, 'Amy', 'Jones', 500000, '2021-02-20 09:00:00', 'Admin'),
(5, 'Sean', 'Garcia', 500000, '2021-06-11 09:00:00', 'Admin'),
(6, 'Ryan', 'Miller', 200000, '2021-06-11 09:00:00', 'Account'),
(7, 'Patty', 'Davis', 75000, '2021-01-20 09:00:00', 'Account'),
(8, 'Monica', 'Rodriguez', 90000, '2021-04-11 09:00:00', 'Admin')
;

INSERT INTO BONUS (WORKER_REF_ID, BONUS_DATE, BONUS_AMOUNT)
VALUES
(1, '2021-02-20 00:00:00', 5000),
(2, '2021-06-11 00:00:00', 3000),
(3, '2021-02-20 00:00:00', 4000),
(1, '2021-02-20 00:00:00', 4500),
(2, '2021-06-11 00:00:00', 3500)
;

INSERT INTO TITLE (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES
(1, 'Manager', '2021-02-20 00:00:00'),
(2, 'Executive', '2021-06-11 00:00:00'),
(8, 'Executive', '2021-06-11 00:00:00'),
(5, 'Manager', '2021-06-11 00:00:00'),
(4, 'Asst. Manager', '2021-06-11 00:00:00'),
(7, 'Executive', '2021-06-11 00:00:00'),
(6, 'Lead', '2021-06-11 00:00:00'),
(3, 'Lead', '2021-06-11 00:00:00')
;

-- a.) Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000 --
SELECT FIRST_NAME, LAST_NAME
FROM WORKER
WHERE SALARY BETWEEN 50000 AND 100000;

-- b.) Write an SQL query to fetch the no. of workers for each department in the descending order. --
SELECT DEPARTMENT, COUNT(WORKER_ID) AS 'Number of Workers'
FROM WORKER
GROUP BY DEPARTMENT
ORDER BY COUNT(WORKER_ID) DESC;

-- c.) Write an SQL query to fetch intersecting records of two tables. --
SELECT * 
FROM WORKER JOIN BONUS
ON WORKER_ID = WORKER_REF_ID;

-- d.) Write an SQL query to determine the 5th highest salary without using TOP or limit method. --
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT
FROM (
    SELECT ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS rownumber, *
    FROM WORKER    
) AS fifth
WHERE rownumber = 5;