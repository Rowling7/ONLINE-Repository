---IF OBJECT_ID('TEMPDB..#text') IS NOT NULL DROP TABLE #text
--�ܼ�
--------------------------------------------------------
select
case 
case when left(K0101 ,1) = 'H' then 'G' 
when left(K0101 ,1) = 'T' then 'S' else left(K0101 ,1) end
when 'G' then 1
when 'S' then 2
when 'X' then 3
when 'Y' then 4
when 'C' then 5
when 'Z' then 6
end,
count(K6008) '0��',
sum(K6008) '0����',
sum(case when K6007=1 then 1 else 0 end) '1��',
sum(case when K6007=1 then K6008 else 0 end)'1����',
sum(case when K6007=2 then 1 else 0 end) '2��',
sum(case when K6007=2 then K6008 else 0 end)'2����',
sum(case when K6007=3 then 1 else 0 end) '3��',
sum(case when K6007=3 then K6008 else 0 end)'3����',
sum(case when K6007=4 then 1 else 0 end) '4��',
sum(case when K6007=4 then K6008 else 0 end)'4����',

sum(case when K6028 in (1,2,3,4,5,9) then 1 else 0 end) '5��',
sum(case when K6028 in (1,2,3,4,5,9) then K6008 else 0 end)'5����',
sum(case when K6028=1 then 1 else 0 end) '6��',
sum(case when K6028=1 then K6008 else 0 end)'6����',
sum(case when K6028=2 then 1 else 0 end) '7��',
sum(case when K6028=2 then K6008 else 0 end)'7����',
sum(case when K6028=3 then 1 else 0 end) '8��',
sum(case when K6028=3 then K6008 else 0 end)'8����',
sum(case when K6028=4 then 1 else 0 end) '9��',
sum(case when K6028=4 then K6008 else 0 end)'9����',
sum(case when K6028=5 then 1 else 0 end) '10��',
sum(case when K6028=5 then K6008 else 0 end)'10����',
sum(case when K6028=9 then 1 else 0 end) '11��',
sum(case when K6028=9 then K6008 else 0 end)'11����'
from K060
group by
(
case 
case when left(K0101 ,1) = 'H' then 'G' 
when left(K0101 ,1) = 'T' then 'S' else left(K0101 ,1) end
when 'G' then 1
when 'S' then 2
when 'X' then 3
when 'Y' then 4
when 'C' then 5
when 'Z' then 6
end
) with rollup
order by 
case 
case when left(K0101 ,1) = 'H' then 'G' 
when left(K0101 ,1) = 'T' then 'S' else left(K0101 ,1) end
when 'G' then 1
when 'S' then 2
when 'X' then 3
when 'Y' then 4
when 'C' then 5
when 'Z' then 6
end
 

--����
-------------------------------------------------------
select
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
case 
case when left(K0101 ,1) = 'H' then 'G' 
when left(K0101 ,1) = 'T' then 'S' else left(K0101 ,1) end
when 'G' then 1
when 'S' then 2
when 'X' then 3
when 'Y' then 4
when 'C' then 5
when 'Z' then 6
end,
count(K6008) '0��',
sum(K6008) '0����',
sum(case when K6007=1 then 1 else 0 end) '1��',
sum(case when K6007=1 then K6008 else 0 end)'1����',
sum(case when K6007=2 then 1 else 0 end) '2��',
sum(case when K6007=2 then K6008 else 0 end)'2����',
sum(case when K6007=3 then 1 else 0 end) '3��',
sum(case when K6007=3 then K6008 else 0 end)'3����',
sum(case when K6007=4 then 1 else 0 end) '4��',
sum(case when K6007=4 then K6008 else 0 end)'4����',

sum(case when K6028 in (1,2,3,4,5,9) then 1 else 0 end) '5��',
sum(case when K6028 in (1,2,3,4,5,9) then K6008 else 0 end)'5����',
sum(case when K6028=1 then 1 else 0 end) '6��',
sum(case when K6028=1 then K6008 else 0 end)'6����',
sum(case when K6028=2 then 1 else 0 end) '7��',
sum(case when K6028=2 then K6008 else 0 end)'7����',
sum(case when K6028=3 then 1 else 0 end) '8��',
sum(case when K6028=3 then K6008 else 0 end)'8����',
sum(case when K6028=4 then 1 else 0 end) '9��',
sum(case when K6028=4 then K6008 else 0 end)'9����',
sum(case when K6028=5 then 1 else 0 end) '10��',
sum(case when K6028=5 then K6008 else 0 end)'10����',
sum(case when K6028=9 then 1 else 0 end) '11��',
sum(case when K6028=9 then K6008 else 0 end)'11����'
from K060
group by
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end, (
case 
case when left(K0101 ,1) = 'H' then 'G' 
when left(K0101 ,1) = 'T' then 'S' else left(K0101 ,1) end
when 'G' then 1
when 'S' then 2
when 'X' then 3
when 'Y' then 4
when 'C' then 5
when 'Z' then 6
end
) with rollup
order by 
case when left(A0103 ,4) = '4290' then left(A0103 ,6) else left(A0103 ,4) end,
case 
case when left(K0101 ,1) = 'H' then 'G' 
when left(K0101 ,1) = 'T' then 'S' else left(K0101 ,1) end
when 'G' then 1
when 'S' then 2
when 'X' then 3
when 'Y' then 4
when 'C' then 5
when 'Z' then 6
end