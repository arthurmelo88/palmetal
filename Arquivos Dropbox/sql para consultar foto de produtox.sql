select e.foto,a.name from x_fotoproduto e join m_product a on e.m_product_id = a.m_product_id where a.m_product_id in (
select m_product_id
       from m_product e
where e.m_product_category_id in(3000900)
	  and (name ilike '%- 80 -%' OR name ilike '%- 90 -%' OR name ilike '%- 90 -%')
      and (name ilike '%- 50 -%' OR name ilike '%- 60 -%')
      and (name ilike '%- 210 -%')-- OR name ilike '%- 160 -%' OR name ilike '%- 170 -%' OR name ilike '%- 180 -%' OR name ilike '%- 190 -%' OR name ilike '%- 200 -%')        
order by m_product_id, name asc ) and e.isactive = 'Y';