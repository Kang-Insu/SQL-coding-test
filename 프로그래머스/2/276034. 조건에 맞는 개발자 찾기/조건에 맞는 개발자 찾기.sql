select d.id, d.email, d.first_name, d.last_name
from developers d
where (skill_code & (select s.code
                    from skillcodes s
                    where name = 'Python')) or
      (skill_code & (select s.code
                     from skillcodes s
                     where name = 'C#'))
order by id;