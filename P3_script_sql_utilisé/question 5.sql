-- liste des 10 appt les plus chers avec le dep et nombre de m_2

select ad_rue,valeur_fonciere, code_dep , surface_m2
from logements
left join adresse on logements.id=adresse.id
left join valeur_fonciere on logements.id=valeur_fonciere.id
where type_log='appartement' 
order by valeur_fonciere desc
limit 10;
