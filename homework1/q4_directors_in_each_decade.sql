select decade,count(*)
from( select distinct p.person_id,select cast(p.born - p.born % 10 as text) as decade
from people as p inner join crew as c
on c.person_id = p.person_id
and c.category = 'director'
and p.born >= 1900)
group by decade
order by decade;
