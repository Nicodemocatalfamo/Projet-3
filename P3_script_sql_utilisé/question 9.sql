-- Moyenne des valeurs foncieres pour le top 3 des communes appartement au departement 6, 13 33, 59,69

with t1 as (
SELECT commune, code_dep, round(avg(valeur_fonciere),2) as moyenne
from valeur_fonciere
natural join adresse
where code_dep in ( 6, 13, 33, 59, 69 )
group by commune),

t2 as (
select code_dep, commune, moyenne,
rank () over ( partition by code_dep order by moyenne desc) as ordre
from t1 )

select code_dep, commune, moyenne
from t2
where ordre <=3;


