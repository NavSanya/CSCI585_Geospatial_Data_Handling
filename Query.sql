--Create Table
DROP TABLE IF EXISTS MAPS;
CREATE TABLE MAPS (name varchar, geom geometry);
INSERT INTO MAPS VALUES
	('Home','POINT(-118.28379 34.02968)'),
	('McClintonEnterance', 'POINT(-118.28714 34.02492)'),
	('CupcakeAtm', 'POINT(-118.28659 34.02088)'),
	('CandGjuiceCo', 'POINT(-118.28633 34.02015)'),
	('AsaVCallLawLibrary', 'POINT(-118.28491 34.01884)'),
	('DohenyLibrary', 'POINT(-118.28408 34.02032)'),
	('ExpositionEnterance', 'POINT(-118.28629 34.01865)'),
	('HahnPlazaFountain', 'POINT(-118.28525 34.02028)'),
	('LeaveyLibrary', 'POINT(-118.28301 34.02170)'),
	('BingTheatreFountain', 'POINT(-118.28556 34.02232)'),
	('JeffersonBlvdAndWattWay', 'POINT(-118.28537 34.02405)'),
	('Starbucks', 'POINT(-118.28413 34.02418)'),
	('USCVillageFountain', 'POINT(-118.28523 34.02527)');


--Convex Hull
SELECT ST_AsText(ST_ConvexHull(ST_Collect(geom))) FROM MAPS;

--Nearest Neighbors of Home
SELECT name, ST_Astext(geom) as location, ST_Distance(geom,'POINT(-118.289474 34.019707)') as distance 
FROM Maps
WHERE name<>'Home' 
ORDER BY ST_Distance(geom,'POINT(-118.28379 34.02968)') 
limit 4;
