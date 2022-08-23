-- ordre decroissant des 10 departements en fonction du prix_m2 le plus élevé

SELECT code_dep, round(avg(valeur_fonciere/surface_m2),2) as prix_m2
FROM adresse
natural join logements 
natural join valeur_fonciere
group by code_dep
order by prix_m2 desc
limit 10 ;

