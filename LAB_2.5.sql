use sakila;

-- 1. Select all the actors with the first name ‘Scarlett’.

select first_name, last_name
from actor
where first_name = 'Scarlett';

-- 2. How many films (movies) are available for rent and how many films have been rented?

select count(distinct(film_id)) as 'movies' , count(distinct(inventory_id)) as 'movie titles rented'
from inventory; 

-- 3. What are the shortest and longest movie duration? Name the values `max_duration` and `min_duration`.

select min(length) as min_duration, max(length) as max_duration
from film;

-- 4. What's the average movie duration expressed in format (hours, minutes)? 

select CONCAT(FLOOR(avg(length)/60),':',LPAD(MOD(avg(length),60),2,'0')) as Hour
from film;

-- 5. How many distinct (different) actors' last names are there?

select count(distinct(last_name))
from actor;

-- 6. Since how many days has the company been operating (check DATEDIFF() function)? 

select datediff(max(rental_date), min(rental_date)) as days_of_work
from rental;

-- 7. Show rental info with additional columns month and weekday. Get 20 results.

select *,  monthname(rental_date) as month, dayname(rental_date) as weekday 
from rental
limit 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
case
when weekday(rental_date)<6 then 'workday'
else 'weekend'
end as day_type 
FROM rental;

-- 9. Get release years.

select distinct(release_year)
from film;

-- 10. Get all films with ARMAGEDDON in the title.

select *
from film
where title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.

select *
from film
where title LIKE '%APOLLO';

-- 12. Get 10 the longest films.

select * 
from film
order by length desc
limit 10;

-- 13. How many films include **Behind the Scenes** content?

select count(title) as 'Movies with behind the scenes'
from film
where special_features LIKE '%Behind the Scenes%';
