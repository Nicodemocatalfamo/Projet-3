
-- Observation / nombre de vente au 1er et au 2eme semestre

SELECT count(nature_mut) as nb_vente1                             -- 16776
FROM dataimmo.details_vente
where date_vente between '2020-01-02' and '2020-03-31' 
union
SELECT count(nature_mut) as nb_vente2                              -- 17393
FROM dataimmo.details_vente
where date_vente between '2020-04-01' and '2020-06-30';

select (17393-16776)/17393*100 as difference_pourcentage;

-- resutat en une requete

with t1 as ( SELECT count(nature_mut) as nb_vente
FROM dataimmo.details_vente
where date_vente between '2020-01-02' and '2020-03-31' ),
t2 as ( SELECT count(nature_mut) as nb_vente2
FROM dataimmo.details_vente
where date_vente between '2020-04-01' and '2020-06-30')

select round((nb_vente2-nb_vente)/nb_vente2*100,2) as pourcentage_diff
from t1, t2;
