---IF OBJECT_ID('TEMPDB..#text') IS NOT NULL DROP TABLE #text
--×Ü¼Æ
-------------------------------------------------------
select
count(K6305) '0×ù',
sum(K6305) '0ÑÓÃ×',
sum(case when K6304=1 then 1 else 0 end) '1×ù',
sum(case when K6304=1 then K6305 else 0 end)'1ÑÓÃ×',
sum(case when K6304=2 then 1 else 0 end) '2×ù',
sum(case when K6304=2 then K6305 else 0 end)'2ÑÓÃ×',
sum(case when K6304=3 then 1 else 0 end) '3×ù',
sum(case when K6304=3 then K6305 else 0 end)'3ÑÓÃ×',
sum(case when K6304=4 then 1 else 0 end) '4×ù',
sum(case when K6304=4 then K6305 else 0 end)'4ÑÓÃ×',

sum(case when k6343 in (1,2,3) then 1 else 0 end) '5×ù',
sum(case when k6343 in (1,2,3) then K6305 else 0 end)'5ÑÓÃ×',
sum(case when k6343=1 then 1 else 0 end) '6×ù',
sum(case when k6343=1 then K6305 else 0 end)'6ÑÓÃ×',
sum(case when k6343=2 then 1 else 0 end) '7×ù',
sum(case when k6343=2 then K6305 else 0 end)'7ÑÓÃ×',
sum(case when k6343=3 then 1 else 0 end) '8×ù',
sum(case when k6343=3 then K6305 else 0 end)'8ÑÓÃ×'
from K063
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

-------------------------------------------------------------------
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
count(K6305) '0×ù',
sum(K6305) '0ÑÓÃ×',
sum(case when K6304=1 then 1 else 0 end) '1×ù',
sum(case when K6304=1 then K6305 else 0 end)'1ÑÓÃ×',
sum(case when K6304=2 then 1 else 0 end) '2×ù',
sum(case when K6304=2 then K6305 else 0 end)'2ÑÓÃ×',
sum(case when K6304=3 then 1 else 0 end) '3×ù',
sum(case when K6304=3 then K6305 else 0 end)'3ÑÓÃ×',
sum(case when K6304=4 then 1 else 0 end) '4×ù',
sum(case when K6304=4 then K6305 else 0 end)'4ÑÓÃ×',

sum(case when k6343 in (1,2,3) then 1 else 0 end) '5×ù',
sum(case when k6343 in (1,2,3) then K6305 else 0 end)'5ÑÓÃ×',
sum(case when k6343=1 then 1 else 0 end) '6×ù',
sum(case when k6343=1 then K6305 else 0 end)'6ÑÓÃ×',
sum(case when k6343=2 then 1 else 0 end) '7×ù',
sum(case when k6343=2 then K6305 else 0 end)'7ÑÓÃ×',
sum(case when k6343=3 then 1 else 0 end) '8×ù',
sum(case when k6343=3 then K6305 else 0 end)'8ÑÓÃ×'
from K063
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