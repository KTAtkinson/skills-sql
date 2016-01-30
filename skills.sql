SELECT * FROM brands;

SELECT *
  FROM models
  WHERE brand_name = 'Pontiac';

SELECT brand_name, name
  FROM models
  WHERE year = 1964;

SELECT models.name,
       brand_name,
       headquarters
FROM models 
  JOIN brands ON brands.name = brand_name
WHERE models.name = 'Mustang' AND brands.name = 'Ford';

SELECT * FROM brands ORDER BY founded DESC LIMIT 3;

SELECT count(id) FROM models WHERE brand_name = 'Ford';

SELECT name FROM brands WHERE discontinued NOTNULL;

SELECT * FROM models ORDER BY name LIMIT 11 OFFSET 15;

SELECT models.brand_name,
  models.name,
  founded
FROM models
  LEFT JOIN brands 
    ON models.brand_name = brands.name
WHERE year = 1960;


SELECT b.name,
       b.founded,
       m.name
FROM brands as b
  LEFT JOIN models as m
    ON b.name = m.brand_name
WHERE discontinued IS NULL;

SELECT b.name,
       b.founded,
       m.name
FROM brands as b
  INNER JOIN models as m
    ON b.name = m.brand_name
WHERE discontinued IS NULL;

-- An left join select all things meeting the criteria on the left side of the 'join' statement, whereas an INNER JOIN
-- only selects only the items which have a value for the row on which you're joining.

SELECT name,
       founded
FROM brands
  LEFT JOIN models
    ON brands.name = models.brand_name
WHERE models.id IS NULL;

ELECT b.name,
       m.name,
       m.year,
       b.discontinued,
       b.discontinued-m.year as years_to_discontinued
FROM models AS m
  LEFT JOIN brands AS b
    ON m.brand_name = b.name
WHERE b.discontinued NOTNULL;
