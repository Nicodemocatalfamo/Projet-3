-- prix_m2 moyen d'une maison en ile de france

SELECT type_log , round(avg(valeur_fonciere/surface_m2),2) as moyenne_prix_m2
from logements
natural join adresse  
natural join valeur_fonciere
Where type_log='maison' and code_dep in ( '91', '92' , '93' ,'94' , '95' , '75', '77', '78')
group by type_log ;

-- arondi à deux chiffres après la virgule 

with t1 as (
SELECT type_log , avg(valeur_fonciere/surface_m2) as moyenne_prix_m2
from logements
left join adresse on logements.id= adresse.id
left join valeur_fonciere on logements.id=valeur_fonciere.id
Where type_log='maison' and code_dep in ( '91', '92' , '93' ,'94' , '95' , '75', '77', '78')
group by type_log )

select type_log, round(moyenne_prix_m2,2) as moyenne_prix_m2
from t1;

-- observation

SELECT avg(prix_m2) as moyenne_prix_m2
from logements
left join adresse on logements.id= adresse.id
Where type_log='maison' and code_dep in ( '91', '92' , '93' ,'94' , '95' , '75', '77', '78')



