select count(id) count
from ecoli_data
where genotype & 2 = 0 and (genotype & 1 = 1 or genotype & 4);