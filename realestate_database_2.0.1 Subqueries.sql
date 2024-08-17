use realestatedb;

-- Subqueries

-- Ticket #1

SELECT 
    (SELECT 
            AVG(ListingPrice)
        FROM
            properties) AS AverageListingPrice;
 
 
-- Ticket #2
    
    SELECT 
    Address
FROM
    properties
WHERE
    ListingPrice = (SELECT 
            MIN(ListingPrice)
        FROM
            properties);

-- Ticket #3


SELECT 
    Address
FROM
    properties
WHERE
    ListingPrice > (SELECT 
            AVG(ListingPrice)
        FROM
            properties);


-- Ticket #4


SELECT 
    a.FirstName, a.LastName
FROM
    agents a
WHERE
    a.AgentID IN (SELECT 
            p.AgentID
        FROM
            properties p
        WHERE
            p.ListingPrice > 500000);
            
         -- Ticket#5
         
         SELECT 
    Address, Bedrooms
FROM
    properties p,
    propertydetails pd
WHERE
    p.PropertyID in (SELECT 
            pd.PropertyID
        FROM
            propertydetails
        WHERE
            Bedrooms = (SELECT 
                    MAX(bedrooms)
                FROM
                    propertydetails));
            
            
            

  -- Ticket #6
          
            
SELECT 
    AVG(Bedrooms)
FROM
    propertydetails;
            
         
         -- Ticket #7

         
SELECT 
    p.*
FROM
    properties p
        INNER JOIN
    propertydetails pd ON p.PropertyID = pd.PropertyID
WHERE
    pd.YearBuilt = (SELECT 
            MIN(YearBuilt)
        FROM
            propertydetails);


-- Ticket #8



SELECT 
    p.Address, pd.Bathrooms
FROM
    properties p
        INNER JOIN
    propertydetails pd ON p.PropertyID = pd.PropertyID
WHERE
    pd.Bathrooms > (SELECT 
            AVG(Bathrooms)
        FROM
            propertydetails);
            
            
            -- Ticket #9

            
SELECT 
    COUNT(DISTINCT pa.PropertyID) AS PropertiesWithPool
FROM
    propertyamenityassignments pa
        INNER JOIN
    propertyamenities a ON pa.AmenityID = a.AmenityID
WHERE
    a.AmenityName = 'Pool';



     -- Ticket #10


SELECT 
    a.AmenityName
FROM
    propertyamenities a
WHERE
    (SELECT 
            COUNT(*)
        FROM
            propertyamenityassignments pa
        WHERE
            pa.AmenityID = a.AmenityID) > 3;
            
            
            -- Ticket #11

            
SELECT 
    p.Address, pd.Bedrooms, p.ListingPrice
FROM
    properties p
        INNER JOIN
    propertydetails pd ON p.PropertyID = pd.PropertyID
WHERE
    pd.Bedrooms > (SELECT 
            AVG(Bedrooms)
        FROM
            propertydetails)
        AND p.ListingPrice > (SELECT 
            AVG(ListingPrice)
        FROM
            properties);
            
            
            
            -- Ticket #12

SELECT 
    c.FirstName, c.LastName
FROM
    clients c
        INNER JOIN
    transactions t ON c.ClientID = t.ClientID
        INNER JOIN
    propertydetails pd ON t.PropertyID = pd.PropertyID
WHERE
    pd.Bedrooms > 3 AND t.SalePrice > 500000;


       
       

           



