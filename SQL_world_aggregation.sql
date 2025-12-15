USE world;

-- Question 1.
-- Count how many cities are there in each country? 

SELECT country.name AS CountryName,COUNT(city.ID) AS 
NumberOfCities FROM country INNER JOIN city 
ON  country.Code = city.CountryCode GROUP BY
country.Name ORDER BY NumberOfCities DESC;

-- Question 2.
-- Display all continents having more than 30 countries.

SELECT Continent,COUNT(Code) AS NumberOfCountries FROM country GROUP BY
Continent HAVING COUNT(Code) > 30;

-- Question 3.
-- List regions whose total population exceeds 200 million.

SELECT Region,SUM(Population) AS PopulationByRegion FROM country
GROUP BY Region HAVING SUM(Population)>200000000 ORDER BY PopulationByRegion DESC;

-- Question 4.
-- Find the top 5 continents by average GNP per country.

SELECT Continent,AVG(GNP) FROM country
GROUP BY Continent ORDER BY AVG(GNP) DESC LIMIT 5;

-- Question 5.
--  Find the total number of official languages spoken in each continent.

SELECT country.Continent,COUNT(countrylanguage.Language) AS TotalOfficialLanguages FROM 
country INNER JOIN countrylanguage WHERE countrylanguage.IsOfficial = 'T'
GROUP BY country.Continent ORDER BY TotalOfficialLanguages DESC;

-- Question 6.
-- Find the maximum and minimum GNP for each continent.

SELECT Continent,MAX(GNP) AS Max_GNP,MIN(GNP) AS Min_GNP FROM country
GROUP BY Continent;

-- Question 7.
-- Find the country with the highest average city population.

SELECT country.Name AS CountryName,AVG(city.Population) AS AvgCityPopulation
FROM country INNER JOIN city ON country.Code = city.CountryCode GROUP BY
country.Name ORDER BY AVG(city.Population) DESC LIMIT 1;

-- Question 8.
-- List continents where the average city population is greater than 200,000.

SELECT country.Continent,AVG(city.Population) AS Avg_Population FROM country INNER JOIN city ON
country.Code = city.CountryCode GROUP BY Continent HAVING AVG(city.Population)
> 200000 ORDER BY AVG(city.Population) DESC;

-- Question 9.
--  Find the total population and average life expectancy for each continent, ordered by average life 
-- expectancy descending.

SELECT Continent,SUM(Population) AS Total_Population,AVG(LifeExpectancy) AS Avg_LifeExpectancy
FROM country GROUP BY Continent ORDER BY AVG(LifeExpectancy) DESC;

-- Question 10.
--  Find the top 3 continents with the highest average life expectancy, but only include those where 
-- the total population is over 200 million.

SELECT Continent,SUM(Population) AS Total_Population,AVG(LifeExpectancy) AS Avg_LifeExpectancy
FROM country GROUP BY Continent HAVING SUM(Population) > 200000000 ORDER BY AVG(LifeExpectancy) DESC LIMIT 3;