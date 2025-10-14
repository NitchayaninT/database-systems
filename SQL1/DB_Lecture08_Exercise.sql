create database MovieInfo;
use MovieInfo;

create table movies(
	title varchar(255),
    year int,
    length int,
    genre varchar(20),
    rating double
);

# add one attribute "movieid" as string into the "movie" table then set it as primary key
alter table movies
add movieid varchar(5) primary key;

# insert data to movie table
insert into movies values ('Chocolate Factory', 2006, 112,'drama', 3.5, 'm01');
insert into movies values ('Star Wars', 1977, 124,'scifi', 4, 'm02');
insert into movies values ('Wizard of Oz', 1970, 100,'adventure', 3, 'm03');

# create moviestar table
create table moviestar(
	starid varchar(5),
    name varchar(50),
    address varchar(255),
    gender varchar(1),
    movieid varchar(5),
    primary key (starid),
    foreign key (movieid) references movies(movieid)
);

insert into moviestar values ('s01', 'Wookiee', 'Hollywood North st.','M','m02');
insert into moviestar values ('s02', 'Willy Wongka', 'Hollywood East st.','M','m01');
insert into moviestar values ('s03', 'Dorothy', 'Hollywood West ave.','F','m03');
insert into moviestar values ('s04', 'Yoda', 'Hollywood North st.','M','m02');
insert into moviestar values ('s05', 'Glinda', 'Hollywood West ave.','F','m03');

# retrieve everything
select * from movies, moviestar; # this one is cross join

# merge the movieid together (natural join)
select * from movies natural join moviestar;

# equivalent join
select * from movies mv, moviestar ms where mv.movieid = ms.movieid;
# its like natural join but columns arent merged together

# TEST YOUR UNDERSTANDING
# 1. Find who played in star wars
select ms.name, mv.title from moviestar ms, movies mv where mv.movieid = ms.movieid and mv.title = "Star Wars"; 

# 2. find which movie that willy wongka played
select ms.name, mv.title from moviestar ms, movies mv where mv.movieid = ms.movieid and ms.name = "Willy Wongka";

# 3. find moviestar's name beginning with "W"
select ms.name from moviestar ms where ms.name like 'W%';

# 4. count the number of actors and the number of actresses from moviestar table
select count(case when ms.gender='M' then ms.name end), count(case when ms.gender='F' then ms.name end)
from moviestar ms;

# 5. find the movie that is older than year 2000 and played by dorothy
select mv.title from movies mv, moviestar ms where mv.movieid = ms.movieid and mv.year < 2000 and ms.name = 'Dorothy';

# 6. show the length difference of Chocolate factory-wizard of oz" and "Star Wars - wizard of Oz"
select distinct (select mv.length from movies mv where mv.title = "Chocolate Factory")-(select mv.length from movies mv where mv.title = "Wizard of Oz") as MovieDiff
from movies;
select distinct (select mv.length from movies mv where mv.title = "Star Wars")-(select mv.length from movies mv where mv.title = "Wizard of Oz") as MovieDiff
from movies;

# 7. Find who played in the movies that the rating >= 3.5
select ms.name from moviestar ms, movies mv where ms.movieid = mv.movieid and mv.rating >= 3.5;

# 8. find the movie that played by an actress
select mv.title, ms.name from moviestar ms, movies mv where ms.movieid = mv.movieid and ms.gender = 'F';

# 9. count the number of actors and actresses for each movie
# For each joined row, return ms.name only if the condition is true; otherwise return NULL
# COUNT counts non-null
select mv.title, count(case when ms.gender='M' then ms.name end), count(case when ms.gender='F' then ms.name end) 
FROM movies AS mv
LEFT JOIN moviestar AS ms ON ms.movieid = mv.movieid
GROUP BY mv.title; # SQL doesn’t know how to summarize per movie, so we need group by to summarize