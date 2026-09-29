SELECT   c.CustomerId,
         c.FirstName,
         c.LastName,
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
         SUM(i.Total) AS InvoiceTotal
FROM     Invoice AS I
GROUP BY i.CustomerId
ORDER BY i.CustomerId;