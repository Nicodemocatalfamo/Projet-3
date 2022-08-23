
-- nombre total des appartements en fonction des pieces et son pourcentage


with t1 as (
select count(nbre_lot) as nbre
from logements
where type_log='appartement'),

t2 as (
select nbre_de_piece as appartement_nbre_de_piece, 
count(nbre_de_piece)*100/nbre as pourcentage
from logements, t1
where type_log='appartement'
group by type_log, nbre_de_piece
order by pourcentage desc
limit 10)

select appartement_nbre_de_piece ,round(pourcentage,2) as pourcentage
from t2;

-- autre façon de faire 

with t1 as (
select count(nbre_lot) as nbre
from logements
where type_log='appartement')

select nbre_de_piece as appartement_nbre_de_piece, 
round((count(nbre_de_piece)*100/nbre),2) as pourcentage
from logements, t1
where type_log='appartement'
group by type_log, nbre_de_piece
order by pourcentage desc
limit 10;

