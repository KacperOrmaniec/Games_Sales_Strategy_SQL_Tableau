SELECT * FROM ps4_gamessales;
SELECT * FROM xboxone_gamesales;

DESCRIBE ps4_gamessales;
DESCRIBE xboxone_gamesales;

SELECT * FROM ps4_gamessales
WHERE Game is null OR Year is null OR Genre is null 
OR Publisher is null OR "North America" is null OR Europe is null
OR Japan is null OR "Rest of World" is null OR Global is null
OR Platform is null;

DELETE FROM ps4_gamessales
WHERE Game is null
LIMIT 1;

SELECT * FROM xboxone_gamesales
WHERE Game is null OR Year is null OR Genre is null 
OR Publisher is null OR "North America" is null OR Europe is null
OR Japan is null OR "Rest of World" is null OR Global is null;

ALTER TABLE ps4_gamessales
ADD COLUMN Platform Varchar(50)
DEFAULT "PS4";
ALTER TABLE xboxone_gamesales
ADD COLUMN Platform Varchar(50)
DEFAULT "Xbox One";

SELECT Game, Platform, Year, Genre, Publisher,`North America`, Europe, Japan, `Rest of World`, Global FROM 
(
		SELECT Game, Platform, Year, Genre, Publisher, `North America`, Europe, Japan, `Rest of World`, Global
		FROM ps4_gamessales
		UNION ALL
		SELECT Game, Platform, Year, Genre, Publisher, `North America`, Europe, Japan, `Rest of World`, Global
		FROM xboxone_gamesales
) subquery
ORDER BY Global DESC;

CREATE TABLE game_sales AS
(
		SELECT Game, Platform, Year, Genre, Publisher, `North America`, Europe, Japan, `Rest of World`, Global
		FROM ps4_gamessales
		UNION ALL
		SELECT Game, Platform, Year, Genre, Publisher, `North America`, Europe, Japan, `Rest of World`, Global
		FROM xboxone_gamesales
)
ORDER BY Global DESC;

SELECT * FROM game_sales;

SELECT Game, SUM(Global) FROM game_sales
GROUP BY Game;