WITH died_form (
	category,
	name,
	death_year,
	title,
	runtime,
	category_rank,
	runtime_rank)
AS (
	SELECT c.category,
	p.name,
	p.died,
	t.primary_title,
	t.runtime_minutes,
	DENSE_RANK() OVER (PARTITION BY c.category
	ORDER BY p.died ASC,p.name),
	DENSE_RANK() OVER (PARTITION BY category_rank
	ORDER BY t.runtime_minutes DESC,t.title_id ASC)
	FROM people AS p
	INNER JOIN crew AS c ON p.person_id = c.person_id
	INNER JOIN titleS AS t ON c.title_id = t.title_id
	WHERE t.runtime_minutes IS NOT NULL
	AND p.died IS NOT NULL
	)
SELECT category,
name,
death_year,
title,
runtime,
category_rank
FROM died_form where category_rank <= 5 AND runtime_rank = 1 ORDER BY category,category_rank;
