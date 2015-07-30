CREATE SEQUENCE adempiere.x_fotoproduto_sq
  INCREMENT 1 MINVALUE 1000000
  MAXVALUE 2147483647 START 9000000
  CACHE 1;

ALTER SEQUENCE adempiere.x_fotoproduto_sq RESTART WITH 9000000;


CREATE OR REPLACE FUNCTION adempiere.x_addfotoproduto (
  psubfamiliaid numeric,
  pcomprimento varchar,
  paltura varchar,
  plargura varchar,
  pprateleira varchar,
  pfoto varchar,
  ptipofoto varchar
)
RETURNS varchar AS
$body$
DECLARE
    vSubfamilia adempiere.m_product.m_product_category_id%TYPE;    
    vM_product_id adempiere.m_product.m_product_id%TYPE;
    vReturn	varchar;
    vComprimento1 varchar;
    vComprimento2 varchar;
    vComprimento3 varchar;
	vAltura1 varchar;
    vAltura2 varchar;
    vAltura3 varchar;
    vAltura4 varchar;
    vAltura5 varchar;
    vAltura6 varchar;
    vLargura1 varchar;
    vLargura2 varchar;
    vPrateleira varchar;
    vFoto varchar;
    vTipofoto varchar;
    vMatch varchar;
    v_return CHARACTER VARYING;
    vPosicaoPrateleira integer;
    r_itens record;
    count integer :=0;
BEGIN
 
if pSubfamiliaID is not null and pSubfamiliaID in (3000897,3000898,3000899,3000900)
and pComprimento is not null and pAltura is not null and pLargura is not null and pPrateleira is not null and pFoto is not null and pTipofoto is not null then

 vSubfamilia := pSubfamiliaID;
 vFoto := pFoto;
 vTipofoto := pTipofoto;
if substring(pComprimento from 1 for 2) in ('80','90') then
 vComprimento1 := '80';
 vComprimento2 := '90';
 vComprimento3 := '90';
end if;
if substring(pComprimento from 1 for 3) in('100','110','118') then
 vComprimento1 := '100';
 vComprimento2 := '110';
 vComprimento3 := '118';
end if;
if substring(pAltura from 1 for 3) in('150','160','170','180','190','200') then
 vAltura1 := '150';
 vAltura2 := '160';
 vAltura3 := '170';
 vAltura4 := '180';
 vAltura5 := '190';
 vAltura6 := '200';
 end if;
 if substring(pAltura from 1 for 3) in ('210','220','230','240','250','260') then
 vAltura1 := '210';
 vAltura2 := '220';
 vAltura3 := '230';
 vAltura4 := '240';
 vAltura5 := '250';
 vAltura6 := '260';
 end if;
 if substring(pLargura from 1 for 2) in ('30','40') then
 vLargura1 := '30';
 vLargura2 := '40';
 end if;
 if substring(pLargura from 1 for 2) in( '50','60') then
 vLargura1 := '50';
 vLargura2 := '60';
 end if; 
 if pPrateleira in ('3','4','5','6','7') then
  vPrateleira := pPrateleira;
else  
  vPrateleira := '0'; 
end if;

ELSE
v_return:= 'vSubfamilia deve ser 3000897 Modelo PLT, 3000898 Modelo PLC, 3000899 Modelo PGT, 3000900 Modelo PGC';
RAISE NOTICE '%', v_return;
end if;

if vPrateleira = '0' then
for i in 3..7 LOOP
if position(' '||i::text||'p' in vFoto) <> 0 THEN
  vPosicaoPrateleira := position (' '||i::text||'p' in vFoto)+1;
  end if;
END LOOP;
end if;

RAISE NOTICE E'C1:%\nC2:%\nC3:%\nA1:%\nA2:%\nA3:%\nA4:%\nA5:%\nA6:%\nL1:%\nL2:%\nPosPrat:%',
vComprimento1,vComprimento2,vComprimento3,vAltura1,vAltura2,vAltura3,vAltura4,vAltura5,vAltura6,vLargura1,vLargura2,vPosicaoPrateleira;


if vPrateleira = '0' then

update adempiere.x_fotoproduto set isactive = 'N' where isactive = 'Y' and created < CURRENT_DATE and m_product_id in (select m_product_id from m_product where m_product_category_id = vSubfamilia
                and (name ilike '%- '||vComprimento1||' -%' or name ilike '%- '||vComprimento2||' -%' or name ilike '%- '||vComprimento3||' -%')
                and (name ilike '%- '||vAltura1||' -%' or name ilike '%- '||vAltura2||' -%' or name ilike '%- '||vAltura3||' -%' or name ilike '%- '||vAltura4||' -%' or name ilike '%- '||vAltura5||' -%' or name ilike '%- '||vAltura6||' -%')
                and (name ilike '%- '||vLargura1||' -%' or name ilike '%- '||vLargura2||' -%'));
RAISE NOTICE E'Fotos desativadas com sucesso!';


for r_itens in (select m_product_id,name, case when substring(name from 49 for 1) =' ' then
        substring(name from 50 for 1)||'p'::text else substring(name from 49 for 1)||'p'::text  end as prateleira
                from m_product where m_product_category_id = vSubfamilia
                and (name ilike '%- '||vComprimento1||' -%' or name ilike '%- '||vComprimento2||' -%' or name ilike '%- '||vComprimento3||' -%')
                and (name ilike '%- '||vAltura1||' -%' or name ilike '%- '||vAltura2||' -%' or name ilike '%- '||vAltura3||' -%' or name ilike '%- '||vAltura4||' -%' or name ilike '%- '||vAltura5||' -%' or name ilike '%- '||vAltura6||' -%')
                and (name ilike '%- '||vLargura1||' -%' or name ilike '%- '||vLargura2||' -%'))
loop

INSERT INTO adempiere.x_fotoproduto ( ad_client_id,ad_org_id,x_fotoproduto_id,m_product_id,isactive,foto,tipofoto) 
values (2000000,2000000,nextval('x_fotoproduto_sq'),r_itens.m_product_id,'Y',overlay(vFoto placing r_itens.prateleira from vPosicaoPrateleira for 2),vTipofoto);
count := count+1;
end loop;  

else 
update adempiere.x_fotoproduto set isactive = 'N' where isactive = 'Y' and created < CURRENT_DATE and m_product_id in (select m_product_id from m_product where m_product_category_id = vSubfamilia
                and (name ilike '%- '||vComprimento1||' -%' or name ilike '%- '||vComprimento2||' -%' or name ilike '%- '||vComprimento3||' -%')
                and (name ilike '%- '||vAltura1||' -%' or name ilike '%- '||vAltura2||' -%' or name ilike '%- '||vAltura3||' -%' or name ilike '%- '||vAltura4||' -%' or name ilike '%- '||vAltura5||' -%' or name ilike '%- '||vAltura6||' -%')
                and (name ilike '%- '||vLargura1||' -%' or name ilike '%- '||vLargura2||' -%')
                and (name ilike '%- '||vPrateleira||' -%'));
RAISE NOTICE E'Fotos desativadas com sucesso!';


for r_itens in (select m_product_id,name, case when substring(name from 49 for 1) =' ' then
        substring(name from 50 for 1)||'p'::text else substring(name from 49 for 1)||'p'::text  end as prateleira
                from m_product where m_product_category_id = vSubfamilia
                and (name ilike '%- '||vComprimento1||' -%' or name ilike '%- '||vComprimento2||' -%' or name ilike '%- '||vComprimento3||' -%')
                and (name ilike '%- '||vAltura1||' -%' or name ilike '%- '||vAltura2||' -%' or name ilike '%- '||vAltura3||' -%' or name ilike '%- '||vAltura4||' -%' or name ilike '%- '||vAltura5||' -%' or name ilike '%- '||vAltura6||' -%')
                and (name ilike '%- '||vLargura1||' -%' or name ilike '%- '||vLargura2||' -%')
				and (name ilike '%- '||vPrateleira||' -%'))
loop

INSERT INTO adempiere.x_fotoproduto ( ad_client_id,ad_org_id,x_fotoproduto_id,m_product_id,isactive,foto,tipofoto) 
values (2000000,2000000,nextval('x_fotoproduto_sq'),r_itens.m_product_id,'Y',vFoto ,vTipofoto);
count := count+1;
end loop;

end if;
v_return :=count::text||' Fotos inseridas com sucesso!';
    RETURN v_return;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;