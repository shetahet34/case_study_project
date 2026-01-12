CREATE TABLE CustomerSubscription (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    SubscriptionType VARCHAR(20),
    SubscriptionDate DATE,
    LastLoginDate DATE,
    TotalSessions INT,
    FeedbackScore INT,
    IsChurned INT
);
INSERT INTO CustomerSubscription VALUES
(1,'Alice Johnson',28,'Female','Monthly','2023-01-15','2024-12-20',45,8,0),
(2,'Bob Smith',35,'Male','Yearly','2022-06-10','2024-05-12',120,9,0),
(3,'Carol White',42,'Female','Quarterly','2023-03-01','2023-11-18',30,6,1),
(4,'David Brown',25,'Male','Monthly','2024-02-05','2024-12-30',15,7,0),
(5,'Emma Wilson',31,'Female','Yearly','2021-09-20','2023-08-10',200,9,1),
(6,'Frank Taylor',50,'Male','Quarterly','2023-07-12','2024-01-05',40,5,1),
(7,'Grace Lee',29,'Female','Monthly','2024-01-01','2025-01-05',22,8,0),
(8,'Henry Clark',38,'Male','Yearly','2022-11-11','2024-09-09',95,7,0),
(9,'Irene Hall',45,'Female','Quarterly','2023-04-18','2023-12-01',28,6,1),
(10,'Jack Miller',33,'Male','Monthly','2024-03-10','2025-01-08',18,9,0),
(11,'Karen Young',27,'Female','Monthly','2024-05-01','2024-11-22',12,7,0),
(12,'Liam King',41,'Male','Yearly','2021-01-25','2023-06-30',160,8,1),
(13,'Mia Scott',36,'Female','Quarterly','2023-08-14','2024-02-19',35,7,0),
(14,'Noah Green',24,'Male','Monthly','2024-06-20','2025-01-02',10,8,0),
(15,'Olivia Adams',48,'Female','Yearly','2020-10-05','2023-03-15',210,9,1),
(16,'Paul Baker',34,'Male','Quarterly','2023-09-09','2024-07-07',42,6,0),
(17,'Queen Rivera',39,'Female','Monthly','2024-04-04','2024-12-29',20,7,0),
(18,'Ryan Cooper',52,'Male','Yearly','2019-12-12','2022-11-01',300,8,1),
(19,'Sophia Perez',26,'Female','Monthly','2024-07-01','2025-01-06',8,9,0),
(20,'Tom Reed',44,'Male','Quarterly','2023-02-22','2023-10-10',33,5,1);


SELECT
    SubscriptionType,
    CASE
        WHEN IsChurned = 0 THEN 'Active'
        ELSE 'Churned'
    END AS CustomerStatus,
    COUNT(*) AS CustomerCount
FROM CustomerSubscription
GROUP BY SubscriptionType, IsChurned
ORDER BY SubscriptionType;


SELECT
    SubscriptionType,
    Gender,
    ROUND(AVG(FeedbackScore), 2) AS AvgFeedbackScore
FROM CustomerSubscription
GROUP BY SubscriptionType, Gender
ORDER BY SubscriptionType, Gender;


SELECT
    CustomerID,
    Name,
    TotalSessions,
    FeedbackScore
FROM CustomerSubscription
WHERE TotalSessions < 5
  AND FeedbackScore < 5;


SELECT
    CustomerID,
    Name,
    LastLoginDate
FROM CustomerSubscription
WHERE LastLoginDate < CURRENT_DATE - INTERVAL '60 days';



SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18–25'
        WHEN Age BETWEEN 26 AND 35 THEN '26–35'
        WHEN Age BETWEEN 36 AND 45 THEN '36–45'
        WHEN Age BETWEEN 46 AND 55 THEN '46–55'
        ELSE '56+'
    END AS AgeGroup,
    COUNT(*) AS TotalCustomers,
    SUM(IsChurned) AS ChurnedCustomers,
    ROUND(SUM(IsChurned) * 100.0 / COUNT(*), 2) AS ChurnRatePercent
FROM CustomerSubscription
GROUP BY AgeGroup
ORDER BY AgeGroup;
