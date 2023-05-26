--Query to create a COUNTER with values against change in CURRENCY 
--

CREATE TABLE CUR(
    ID int,
    CURRENCY varchar(255)
);

INSERT INTO CUR(ID, CURRENCY)
VALUES
(1, 'INR'),
(2, 'GBP'),
(3, 'GBP'),
(4, 'USD'),
(5, 'USD'),
(6,  NULL),
(7, 'INR'),
(8, 'RAND'),
(9, ''),
(10,'')

SELECT CURR.ID, CURR.CURRENCY,
    SUM(CASE WHEN CURR.LAG_CURRENCY = CURR.CURRENCY THEN 0 ELSE 1 END) OVER(ORDER BY CURR.ID) AS COUNTER
FROM (
    SELECT CUR.ID, CUR.CURRENCY, LAG(CUR.CURRENCY, 1, null) OVER(ORDER BY CUR.ID) AS LAG_CURRENCY
    FROM CUR -- Lag column has the first value as NULL. This is because the LAG function is supposed to return the last row value from the current row. 
) CURR
