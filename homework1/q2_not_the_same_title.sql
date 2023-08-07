select premiered,primary_title || '(' || original_title || ')'
    from titles
        where primary_title <> original_title
           and genres like '%Action%'
           and type = 'movie'
           
order by premiered desc,premiered
limit 10;

