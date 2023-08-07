WITH json_table(json_data) AS (
	SELECT c.characters as json_data
	FROM people as p INNER JOIN crew as c
	on p.person_id = c.person_id
	where p.name = 'Leonardo DiCaprio'
		AND p.born = 1974 
		AND c.characters NOT LIKE '%Self%'
	),
	Characters(charaster) AS (
	SELECT DISTINCT value AS charaster
	FROM json_table,json_each(json_data)
	WHERE charaster <> ""
	ORDER BY charaster)
	
SELECT group_concat(charaster)
FROM Characters;
