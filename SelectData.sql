SELECT   c.CustomerId,
         c.FirstName,
         c.LastName,
         -- c.FirstName+ ' ' + c.LastName ASCustomerName,
         CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
         c.City,
         c.Company
FROM     Customer AS c
WHERE    C.Company IS NOT NULL
--WHERE  c.City IN ('LONDON', 'PARIS', 'ROME', 'BERLIN')
--WHERE c.LastName LIKE '%R'
ORDER BY C.Company ASC;

SELECT   c.Country,
         COUNT(*) AS NumberOfCustomers
FROM     Customer AS c
GROUP BY c.Country
ORDER BY NumberOfCustomers DESC;

--Looking at Invoices
SELECT   i.InvoiceId,
         i.InvoiceDate,
         i.CustomerId,
         i.Total
FROM     Invoice AS I
ORDER BY i.CustomerId;

SELECT   i.CustomerId,
         c.FirstName,
         c.LastName,
         CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
         SUM(i.Total) AS InvoiceTotal,
         COUNT(*) AS NumberOfInvoices
FROM     Invoice AS i
         INNER JOIN
         Customer AS c
         ON i.CustomerId = c.CustomerId
GROUP BY i.CustomerId, c.FirstName, c.LastName, CONCAT(c.FirstName, ' ', c.LastName)
ORDER BY i.CustomerId;

--Alternstive Way
SELECT ibc.CustomerId,
       CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
       CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
       ibc.InvoiceTotal,
       ibc.NumberOfInvoices
FROM   (SELECT   i.CustomerId,
                 SUM(i.Total) AS InvoiceTotal,
                 COUNT(*) AS NumberOfInvoices
        FROM     Invoice AS i
        GROUP BY i.CustomerId) AS IBC
       INNER JOIN
       Customer AS C
       ON IBC.CustomerId = c.CustomerId
       INNER JOIN
       Employee AS e
       ON c.SupportRepId = e.EmployeeId;

-- Customer and Employees
SELECT e.EmployeeId,
       e.FirstName,
       e.LastName,
       CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
       CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName
FROM   Employee AS e
       INNER JOIN
       Customer AS c
       ON e.EmployeeId = c.SupportRepId;