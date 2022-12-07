-- --In order to see what columns are good for indexing we should see the columns that are unique or columns where there are a few duplicates
select count(distinct part_number), count(part_number)
from part_nyc;
select count(distinct supplier), count(supplier)
from part_nyc;
select count(distinct color), count(color)
from part_nyc;
select count(distinct on_hand), count(on_hand)
from part_nyc;
select count(distinct descr), count(descr)
from part_nyc;

select count(distinct part_number), count(part_number)
from part_sfo;
select count(distinct supplier), count(supplier)
from part_sfo;
select count(distinct color), count(color)
from part_sfo;
select count(distinct on_hand), count(on_hand)
from part_sfo;
select count(distinct descr), count(descr)
from part_sfo;


select count(distinct supplier_id), count(supplier_id)
from supplier;
select count(distinct supplier_name), count(supplier_name)
from supplier;

select count(distinct color_id), count(color_id)
from color;
select count(distinct color_name), count(color_name)
from color;