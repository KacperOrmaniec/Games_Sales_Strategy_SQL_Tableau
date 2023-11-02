SELECT Game, SUM(Global) FROM game_sales
GROUP BY Game;



SELECT Platform, SUM(Global) as Total_Sales, SUM(`North America`) AS NA_Sales,
SUM(Japan) AS JP_Sales, SUM(Europe) AS EU_Sales
FROM game_sales
GROUP BY Platform;

SELECT Game, Platform, `North America` AS NA_Sales, Japan AS JP_Sales, 
Europe AS EU_Sales, Global AS Total_Sales
FROM game_sales
ORDER BY Total_Sales DESC;




SELECT Genre, SUM(`North America`) AS NA_Sales,
SUM(Japan) AS JP_Sales, SUM(Europe) AS EU_Sales,  SUM(Global) as Total_Sales
FROM game_sales
GROUP BY Genre
ORDER BY Total_Sales DESC;

SELECT Platform, Genre, SUM(`North America`) AS NA_Sales,
SUM(Japan) AS JP_Sales, SUM(Europe) AS EU_Sales,  SUM(Global) as Total_Sales
FROM game_sales
GROUP BY Platform, Genre
ORDER BY Genre ASC;




Select Publisher, COUNT(Game) AS Number_Of_Games, SUM(`North America`) AS NA_Sales,
SUM(Japan) AS JP_Sales, SUM(Europe) AS EU_Sales,  SUM(Global) as Total_Sales
FROM game_sales
GROUP BY Publisher
ORDER BY Total_Sales DESC;

