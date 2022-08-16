--Create a table named ‘matches’ with appropriate data types for columns
create table matches(
id integer unique,
city varchar,
date Date,
player_of_match varchar,
venue varchar,
neutral_venue integer
team1 varchar,
team2 varchar,
toss_winner varchar,
toss_decision varchar,
add winner varchar,
add result varchar,
result_margin integer,
eliminator varchar,
method varchar,
umpire1 varchar,
umpire2 varchar);


--Create a table named ‘deliveries’ with appropriate data types for columns
create table deliveries(
id integer unique,
inning integer,
over integer,
ball integer,
batsman varchar,
non_striker varchar,
bowler varchar,
batsman_runs integer,
extra_run integer,
total_runs integer,
is_wicket integer,
dismissal_kind varchar,
player_dismissed varchar,
fielder varchar,
extras_type varchar,
batting_team varchar,
bowling_team varchar);


--Import data from CSV file ’IPL_matches.csv’ attached in resources to ‘matches’
copy deliveries from 'C:\Program Files\PostgreSQL\14\data\IPL_matches.csv' DELIMITER ',' CSV Header;


--Import data from CSV file ’IPL_ball.csv’ attached in resources to ‘deliveries’
copy deliveries from 'C:\Program Files\PostgreSQL\14\data\IPL_ball.csv' DELIMITER ',' CSV Header;


--Select the top 20 rows of the deliveries table.
select * from deliveries limit 20;

--Select the top 20 rows of the matches table.
select * from matches limit 20;

--Fetch data of all the matches played on 2nd May 2013.
select * from matches
Where date ='2013-05-02';

--Fetch data of all the matches where the margin of victory is more than 100 runs.
select * from matches
where result_margin > 100;

/*Fetch data of all the matches where the final scores of both teams tied 
and order it in descending order of the date.*/
select * from matches
where result = 'tie'
order by date desc;

-- Get the count of cities that have hosted an IPL match.
select colunt(distinct city) 
from matches;

-- Number of Matches played in each city which has hosted IPL
select city, Count (*) as "Number of games played" from matches
Group By city
order by city;
