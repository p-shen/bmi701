Question 1.
a)
select count(*) from `patients` where `patients`.`sex` = 'F';

16751

b)
select count(*) from `diag3d` where diag3d.diag = '(250) Diabetes mellitus';

1261

c)
select count(*) from `patients`
join `pmh` on `patients`.`id` = `pmh`.`id`
join `drugs` on `patients`.`id` = `drugs`.`id`
where `pmh`.`arthritis` = 1
AND `drugs`.`drug` = 'celecoxib';

101

d)
select * from
(select count(`visitreason`) as 'count', visitreason
from `patients` group by `visitreason`) as A
order by `count` desc

1925	General medical examination

e)

select count(*) from (
    select count(*) as `count` from `patients`
    join `tests` on `patients`.`id` = `tests`.`id`
    where `tests`.`test` in ('glucose', 'hba1c')
    group by `patients`.`id`) as `A`
where `A`.`count` = 2;

395

Question 2:
a)
select count(*) from `patients`
join `pmh` on `patients`.id = `pmh`.id
where `pmh`.diabetes = 1;

2955

select count(*) from `patients`
join `pmh` on `patients`.id = `pmh`.id
join `tests` on `tests`.id = `patients`.id
where `pmh`.diabetes = 1 and `tests`.test = 'hba1c'

441

441/2955 = 14.9%

b)
select count(*) from `patients`
join `pmh` on `patients`.id = `pmh`.id
where `pmh`.htn = 1

7026

select count(*) from `patients` where id in (
    select `patients`.id from `patients`
    join `pmh` on `patients`.id = `pmh`.id
    where `pmh`.htn = 1)
and sbp is null or sbp = '';

1992

1992/7026 = 28.4%

c)
select count(`patients`.id) from `patients`
    join `pmh` on `patients`.id = `pmh`.id
    where `pmh`. hyperlipid = 1
3975

patients with hyperlipid who are taking drugs
select * from `drugs` where `drugs`.id in (
    select `patients`.id from `patients`
    join `pmh` on `patients`.id = `pmh`.id
    where `pmh`.hyperlipid = 1)

3463
3975 - 3463 = 512 who are not taking drugs

512 / 3975 = 12.9%

select drug from `drugclasses` where `drugclasses`.level2 = 'Metabolic agents; antihyperlipidemia agents';
