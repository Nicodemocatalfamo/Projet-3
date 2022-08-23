
-- nombre d'appartement vendu au 1er_semestre 

select count(nbre_lot) as nombre_app_vendu
from logements 
where type_log='appartement';



