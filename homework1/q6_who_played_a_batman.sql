with
batman as (select p.person_id as person_id,p.name as name
from people as p inner join crew as c
on p.person_id = c.person_id
where c.category = 'actor'
and c.characters like '%"Batman"%')
select b.name,round(avg(r.rating),2)
from batman as b inner join crew as c
on b.person_id =c.person_id
inner join ratings as r
on r.title_id = c.title_id
group by b.name
order by round(avg(r.rating),2) desc
limit 10;
