
-- nombre de vente par commune au 1er trimestre

SELECT commune, count(nature_mut) as vente_commune_1t
FROM adresse
left join details_vente on adresse.id=details_vente.id
where date_vente between '2020-01-02' and '2020-03-31'
group by commune
order by vente_commune_1t desc;

-- nombre de vente par commune au 2eme trimestre

SELECT commune, count(nature_mut) as vente_commune_2t
FROM adresse
left join details_vente on adresse.id=details_vente.id
where date_vente between '2020-04-01' and '2020-06-30'
group by commune
order by vente_commune_2t desc;
 
-- en une requete 

with t1 as (
SELECT commune, count(nature_mut) as v1
FROM adresse
left join details_vente on adresse.id=details_vente.id
where date_vente between '2020-01-02' and '2020-03-31'
group by commune),
t2 as (
SELECT commune, count(nature_mut) as v2
FROM adresse
left join details_vente on adresse.id=details_vente.id
where date_vente between '2020-04-01' and '2020-06-30'
group by commune )

select commune, round(((v2-v1)/v2)*100,2) as augmentation
from t1
natural join t2
having augmentation > 20
order by augmentation asc;

