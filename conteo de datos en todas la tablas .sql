select 
t.NAME AS TABLENAME, 
p.rows as rowcounts
from sys.tables t
inner join
sys.indexes i on t.object_id = i.object_id
inner join 
sys.partitions p on i.object_id = p.object_id and i.index_id
= p.index_id where p.rows > 0
order by  p.rows desc