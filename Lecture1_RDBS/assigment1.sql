1.
a)
select count(*) from `patients` where `patients`.sex = 'F';

16751

b)
select count(*) from diag3d where diag3d.diag = '(250) Diabetes mellitus';

1261

c)
select count(*) from `patients`
join `pmh` on `patients`.id = `pmh`.id
join `drugs` on `patients`.id = `drugs`.id
where `pmh`.arthritis = 1
AND `drugs`.drug = 'celecoxib';

101

d)
select * from
(select count(visitreason) as 'count', visitreason
from patients group by visitreason) as A
order by count desc

1925	General medical examination
