
-- observation prix_m2 moyen d'un app 2 et 3 Pieces.

SELECT count(type_log) as nombre_appartement, nbre_de_piece,
sum(valeur_fonciere/surface_m2)/count(type_log) as prix_Moyen
FROM logements
natural join valeur_fonciere 
where type_log='appartement' and ( nbre_de_piece=3 OR nbre_de_piece=2)
group by nbre_de_piece;

-- même requete avec AVG

SELECT count(type_log) as nombre_appartement, nbre_de_piece,
round(AVG(valeur_fonciere/surface_m2),2) as prix_Moyen
FROM dataimmo.logements 
natural join valeur_fonciere
where type_log='appartement' and ( nbre_de_piece=3 OR nbre_de_piece=2)
group by nbre_de_piece; 


-- en une seul requete

with t1 as (
SELECT nbre_de_piece,
sum(valeur_fonciere/surface_m2)/count(nbre_lot) as prix_Moyen_1 -- ou avg
FROM logements 
natural join valeur_fonciere
where type_log='appartement' and nbre_de_piece=3
group by nbre_de_piece),
t2 as (
SELECT nbre_de_piece,
sum(valeur_fonciere/surface_m2)/count(nbre_lot) as prix_Moyen_2 -- ou avg
FROM logements 
natural join valeur_fonciere
where type_log='appartement' and  nbre_de_piece=2
group by nbre_de_piece )

select round((prix_moyen_1-prix_moyen_2)/prix_moyen_1*100,2) as pourcentage_diff
from t2,t1