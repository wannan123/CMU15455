select t.type,round(avg(r.rating),2),min(r.rating),max(r.rating)
from titles as t inner join akas as a
on t.title_id = a.title_id
inner join ratings as r on r.title_id = a.title_id
where a.language = 'de' and a.types in('imdbDisplay','original')
group by t.type
order by round(avg(r.rating),2);
