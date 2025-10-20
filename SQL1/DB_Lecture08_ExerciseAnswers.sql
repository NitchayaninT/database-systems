use movieinfo;

select name
from movies, moviestar
where movies.movieid = moviestar.movieid and title='Star Wars';

select name 
from movies join moviestar on movies.movieid = moviestar.movieid
where title='Star Wars';

select Title
from movies join moviestar on movies.movieid = moviestar.movieid
where name='Willy Wongka';

select name
from moviestar
where name Like 'W%W%k_';

select gender, count(*) as no_gender
from moviestar
group by gender;

select Title
from movies join moviestar on movies.movieid = moviestar.movieid
where name='Dorothy' and year <2000;

select name
from movies join moviestar on movies.movieid = moviestar.movieid
where rating >3.5;


select title, abs(length-(select length from movies where title = 'Wizard of Oz')) as diffDuration
from movies
where title <> 'Wizard of Oz';

select distinct title
from movies join moviestar on movies.movieid = moviestar.movieid
where gender = 'f';


select moviestar.movieid, title, gender, count(*)
from movies join moviestar on movies.movieid = moviestar.movieid
group by moviestar.movieid, gender;
