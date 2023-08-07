WITH year as (SELECT premiered FROM akas INNER JOIN titles
    on akas.title_id = titles.title_id where akas.title = 'The Prestige'
)
SELECT COUNT(*) FROM
(SELECT DISTINCT people.person_id FROM people INNER JOIN crew
     on people.person_id = crew.person_id
     INNER JOIN year
     on people.born = year.premiered
     WHERE crew.category in ('actor','actress')
);
