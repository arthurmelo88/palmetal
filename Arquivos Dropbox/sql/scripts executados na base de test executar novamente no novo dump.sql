delete from ad_ref_table e where e.ad_reference_id = 2000009;
delete from m_production;
DELETE FROM AD_Column WHERE AD_Column_ID=2085;
update ad_column set ad_reference_value_id = null where ad_reference_value_id = 2000009;
delete from ad_reference where name = 'M_Shipper';
delete from ad_column where ad_table_id = 253 and columnname = 'Name';
delete from ad_column where ad_table_id = 497 and columnname = 'M_Product_ID';
delete from cm_Chat e where e.cm_chat_id in (select max(cm_Chat_id) from cm_chat group by record_id , ad_table_id having count(record_ID) > 1);

update ad_modelvalidator set isactive = 'N' where entitytype = 'LBRA';
update ad_scheduler set isactive = 'N' where ad_scheduler_id >= 2000000;
update c_acctprocessor set isactive = 'N' where c_acctprocessor.c_acctprocessor_id = 2000000;
update  aD_ref_table set whereclause = E'(AD_Language.IsSystemLanguage=''Y'' OR AD_Language.IsBaseLanguage=''Y'')' where ad_reference_id = 327 ;
delete from ad_language where ad_language.ad_language in ('xx_XX');
update ad_language set isbaselanguage = 'Y' where ad_language  = 'en_US';
update ad_language set issystemlanguage = 'N' where ad_language  = 'en_US';
update ad_language set isbaselanguage = 'N' where ad_language  = 'pt_BR';
update ad_language set issystemlanguage = 'Y' where ad_language  = 'pt_BR';

/* update a executar apos finalizar migração da base de dados completa */ 

update ad_Column set ad_reference_value_id = (select ad_reference_id from ad_reference where name = 'M_Shipper') where ad_column_id = 2000548;

delete from ad_field e where e.ad_field_id in( select max(ad_field_id) from ad_field group by ad_tab_id,ad_column_id having count(ad_Field_id)>1);

delete from ad_field  where ad_column_id not in (select ad_column_id from ad_column)
or ad_tab_id not in (select ad_tab_id from ad_tab)
or ad_fieldgroup_id not in (select ad_fieldgroup_id from ad_fieldgroup)
or ad_reference_id not in (select ad_reference_id from ad_reference)
or ad_reference_value_id not in (select ad_reference_id from ad_reference)
or ad_val_rule_id not in (select ad_val_rule_id from ad_val_rule)
or entitytype not in (select entitytype from ad_entitytype)
or ad_client_id not in (select ad_client_id from ad_client)
or ad_org_id not in ( select ad_org_id from ad_org)
or included_tab_id not in (select ad_tab_id from ad_tab);
  
ALTER TABLE  ad_attachmentnote
  ADD CONSTRAINT adattachment_note FOREIGN KEY (ad_attachment_id)
    REFERENCES  ad_attachment(ad_attachment_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
CREATE UNIQUE INDEX ad_field_column ON  ad_field
  USING btree (ad_tab_id, ad_column_id);	
	
-- object recreation
ALTER TABLE  ad_field
  DROP CONSTRAINT ad_column_field RESTRICT;

ALTER TABLE  ad_field
  ADD CONSTRAINT ad_column_field FOREIGN KEY (ad_column_id)
    REFERENCES  ad_column(ad_column_id)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
-- object recreation
ALTER TABLE  ad_field
  DROP CONSTRAINT ad_tab_field RESTRICT;  
  ALTER TABLE  ad_field add CONSTRAINT ad_tab_field FOREIGN KEY (ad_tab_id)
    REFERENCES  ad_tab(ad_tab_id)
    MATCH SIMPLE
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
		-- object recreation ---------------------------------------------
ALTER TABLE  ad_field
  DROP CONSTRAINT adfieldgroup_adfield RESTRICT;
  ALTER TABLE  ad_field add CONSTRAINT adfieldgroup_adfield FOREIGN KEY (ad_fieldgroup_id)
    REFERENCES  ad_fieldgroup(ad_fieldgroup_id)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
		-- object recreation
ALTER TABLE  ad_field
  DROP CONSTRAINT adreference_adfield RESTRICT;
  ALTER TABLE  ad_field add CONSTRAINT adreference_adfield FOREIGN KEY (ad_reference_id)
    REFERENCES  ad_reference(ad_reference_id)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
		-- object recreation
ALTER TABLE  ad_field
  DROP CONSTRAINT adreferencevalue_adfield RESTRICT;
  ALTER TABLE  ad_field add CONSTRAINT adreferencevalue_adfield FOREIGN KEY (ad_reference_value_id)
    REFERENCES  ad_reference(ad_reference_id)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
		-- object recreation
ALTER TABLE  ad_field
  DROP CONSTRAINT advalrule_adfield RESTRICT;
  ALTER TABLE  ad_field add CONSTRAINT advalrule_adfield FOREIGN KEY (ad_val_rule_id)
    REFERENCES  ad_val_rule(ad_val_rule_id)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
		-- object recreation
ALTER TABLE  ad_field
  DROP CONSTRAINT entityt_adfield RESTRICT;
  ALTER TABLE  ad_field add CONSTRAINT entityt_adfield FOREIGN KEY (entitytype)
    REFERENCES  ad_entitytype(entitytype)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
		-- object recreation
ALTER TABLE  ad_field
  DROP CONSTRAINT fieldclient RESTRICT;
  ALTER TABLE  ad_field add CONSTRAINT fieldclient FOREIGN KEY (ad_client_id)
    REFERENCES  ad_client(ad_client_id)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
		-- object recreation
ALTER TABLE  ad_field
  DROP CONSTRAINT fieldorg RESTRICT;
  ALTER TABLE  ad_field add CONSTRAINT fieldorg FOREIGN KEY (ad_org_id)
    REFERENCES  ad_org(ad_org_id)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
		-- object recreation
ALTER TABLE  ad_field
  DROP CONSTRAINT includedtab_adfield RESTRICT;
  ALTER TABLE  ad_field add CONSTRAINT includedtab_adfield FOREIGN KEY (included_tab_id)
    REFERENCES  ad_tab(ad_tab_id)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	/* **************************************************************************************************************** */ 
	
INSERT INTO t_alter_column values('m_product_category_trl','description','VARCHAR(2000)',null,'NULL');
INSERT INTO t_alter_column values('m_product_category_trl','name','VARCHAR(255)',null,'NULL');
INSERT INTO t_alter_column values('m_product_trl','description','VARCHAR(2000)',null,'NULL');
update ad_column set fieldlength = 255 where ad_column_id  = 211011;
update ad_column set fieldlength = 2000 where ad_column_id  = 13008;
update ad_column set fieldlength = 2000 where ad_column_id  = 211010;
select add_missing_translations();
delete from ad_field_trl where ad_field_id not in (select ad_field_id from ad_field);

ALTER TABLE  ad_field_trl
  ADD CONSTRAINT ad_fieldtrl FOREIGN KEY (ad_field_id)
    REFERENCES  ad_field(ad_field_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
    

ALTER TABLE  ad_orginfo
  DROP CONSTRAINT ad_orginfo_lbr_isscan_check RESTRICT;
  
  /* ad_pinstance */ 
  
ALTER TABLE  ad_pinstance
  ADD CONSTRAINT adprocess_adpinstance FOREIGN KEY (ad_process_id)
    REFERENCES  ad_process(ad_process_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
ALTER TABLE  ad_pinstance
  ADD CONSTRAINT aduser_pinstance FOREIGN KEY (ad_user_id)
    REFERENCES  ad_user(ad_user_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;

CREATE INDEX ad_pinstance_record ON  ad_pinstance
  USING btree (ad_process_id, record_id);
  
  /* ad_pinstance_log */ 
  
  CREATE TABLE  ad_pinstance_log_new (
  ad_pinstance_id NUMERIC(10,0) NOT NULL,
  log_id NUMERIC(10,0) NOT NULL,
  p_date TIMESTAMP WITHOUT TIME ZONE DEFAULT now(),
  p_id NUMERIC(10,0),
  p_number NUMERIC,
  p_msg VARCHAR(2000),
  ad_pinstance_log_uu VARCHAR(36) DEFAULT NULL::character varying,
  ad_table_id NUMERIC(10,0) DEFAULT NULL::numeric,
  record_id NUMERIC(10,0) DEFAULT NULL::numeric,
  CONSTRAINT ad_pinstance_log_new_pkey PRIMARY KEY(ad_pinstance_id, log_id),
  CONSTRAINT adtable_adpinstancelog FOREIGN KEY (ad_table_id)
    REFERENCES  ad_table(ad_table_id)
    MATCH SIMPLE
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED
) 
WITH (oids = false);

CREATE UNIQUE INDEX ad_pinstance_log_new_uu_idx ON  ad_pinstance_log_new
  USING btree (ad_pinstance_log_uu COLLATE pg_catalog."default");

INSERT INTO  ad_pinstance_log_new
SELECT * FROM ONLY  ad_pinstance_log;
  commit;
  delete from ad_pinstance_log ;
  commit;
  
ALTER TABLE  ad_pinstance_log
  ADD CONSTRAINT adpinstance_pilog FOREIGN KEY (ad_pinstance_id)
    REFERENCES  ad_pinstance(ad_pinstance_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	commit;
	
	INSERT INTO  ad_pinstance_log
SELECT * FROM ONLY  ad_pinstance_log_new;
commit;
DROP TABLE  ad_pinstance_log_new;
commit;
/* ad_pinstance_para */ 

CREATE TABLE  ad_pinstance_para_new (
  ad_pinstance_id NUMERIC(10,0) NOT NULL,
  seqno NUMERIC(10,0) NOT NULL,
  parametername VARCHAR(60),
  p_string VARCHAR(255),
  p_string_to VARCHAR(255),
  p_number NUMERIC,
  p_number_to NUMERIC,
  p_date TIMESTAMP WITHOUT TIME ZONE,
  p_date_to TIMESTAMP WITHOUT TIME ZONE,
  info VARCHAR(255),
  info_to VARCHAR(60),
  ad_client_id NUMERIC(10,0),
  ad_org_id NUMERIC(10,0),
  created TIMESTAMP WITHOUT TIME ZONE DEFAULT statement_timestamp() NOT NULL,
  createdby NUMERIC(10,0),
  updated TIMESTAMP WITHOUT TIME ZONE DEFAULT statement_timestamp() NOT NULL,
  updatedby NUMERIC(10,0),
  isactive CHAR(1) DEFAULT 'Y'::bpchar,
  ad_pinstance_para_uu VARCHAR(36) DEFAULT NULL::character varying,
  CONSTRAINT ad_pinstance_para_new_pkey PRIMARY KEY(ad_pinstance_id, seqno)
) 
WITH (oids = false);

CREATE UNIQUE INDEX ad_pinstance_para_new_uu_idx ON  ad_pinstance_para_new
  USING btree (ad_pinstance_para_uu COLLATE pg_catalog."default");
commit;
INSERT INTO  ad_pinstance_para_new
SELECT * FROM ONLY  ad_pinstance_para;

delete from ad_pinstance_para;
commit;
ALTER TABLE  ad_pinstance_para
  ADD CONSTRAINT adpinstance_adpinstancepara FOREIGN KEY (ad_pinstance_id)
    REFERENCES  ad_pinstance(ad_pinstance_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	commit;
INSERT INTO  ad_pinstance_para
SELECT * FROM ONLY  ad_pinstance_para_new;
commit;
drop table   ad_pinstance_para_new;	
commit;

/* ad_userdef_field  */ 
ALTER TABLE  ad_userdef_field
  ADD CONSTRAINT adfield_aduserdeffield FOREIGN KEY (ad_field_id)
    REFERENCES  ad_field(ad_field_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
/* asp_clientexception */	

ALTER TABLE  asp_clientexception
  ADD CONSTRAINT adfield_aspclientexception FOREIGN KEY (ad_field_id)
    REFERENCES  ad_field(ad_field_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;	

	/* c_bpartner */ 	
	
INSERT INTO t_alter_column values('c_bpartner','lbr_isieexempt','CHAR(1)',null ,'N');
update c_bpartner set lbr_cnpj = replace(lbr_cnpj,'/',''),
lbr_cpf = replace(lbr_cpf,'/','') ;
update c_bpartner set lbr_cnpj = replace(lbr_cnpj,'-',''),
lbr_cpf = replace(lbr_cpf,'-','') ;
update c_bpartner set lbr_cnpj = replace(lbr_cnpj,'.',''),
lbr_cpf = replace(lbr_cpf,'.','') ;
update c_bpartner set lbr_cnpj = replace(lbr_cnpj,',',''),
lbr_cpf = replace(lbr_cpf,',','') ;
update c_bpartner set lbr_cnpj = replace(lbr_cnpj,' ',''),
lbr_cpf = replace(lbr_cpf,' ','');
update c_bpartner set lbr_cnpj = substr(lbr_cnpj,1,14) where length(lbr_cnpj)>14;
update c_bpartner set lbr_cpf = substr(lbr_cpf,1,11) where length(lbr_cpf)>11;
INSERT INTO t_alter_column values('c_bpartner','lbr_cnpj','VARCHAR(14)', null,NULL);
INSERT INTO t_alter_column values('c_bpartner','lbr_cpf','VARCHAR(11)', null,NULL);

/* c_invoiceline */ 
INSERT INTO t_alter_column values('c_invoiceline','lbr_tax_id','NUMERIC(10)', null,NULL);
/* c_order */ 
INSERT INTO t_alter_column values('c_order','lbr_transactiontype','VARCHAR(3)', null,NULL);
INSERT INTO t_alter_column values('c_orderline','lbr_tax_id','NUMERIC(10)', null,NULL);

/* m_attribute */
ALTER TABLE  m_attributeinstance
  ADD CONSTRAINT mattribute_mattributeinst FOREIGN KEY (m_attribute_id)
    REFERENCES  m_attribute(m_attribute_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	
ALTER TABLE  m_attributeinstance
  ADD CONSTRAINT mattributevalue_mattrinst FOREIGN KEY (m_attributevalue_id)
    REFERENCES  m_attributevalue(m_attributevalue_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	
ALTER TABLE  m_attributeinstance
  ADD CONSTRAINT mattrsetinst__mattrinst FOREIGN KEY (m_attributesetinstance_id)
    REFERENCES  m_attributesetinstance(m_attributesetinstance_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	/*	m_cost	*/
	
	
ALTER TABLE  m_cost
  ADD CONSTRAINT adclient_mcost FOREIGN KEY (ad_client_id)
    REFERENCES  ad_client(ad_client_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	
ALTER TABLE  m_cost
  ADD CONSTRAINT adorg_m_cost FOREIGN KEY (ad_org_id)
    REFERENCES  ad_org(ad_org_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	
ALTER TABLE  m_cost
  ADD CONSTRAINT cacctschema_mcost FOREIGN KEY (c_acctschema_id)
    REFERENCES  c_acctschema(c_acctschema_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	
ALTER TABLE  m_cost
  ADD CONSTRAINT masi_mcost FOREIGN KEY (m_attributesetinstance_id)
    REFERENCES  m_attributesetinstance(m_attributesetinstance_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	
ALTER TABLE  m_cost
  ADD CONSTRAINT mcostelement_mcost FOREIGN KEY (m_costelement_id)
    REFERENCES  m_costelement(m_costelement_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	
ALTER TABLE  m_cost
  ADD CONSTRAINT mcosttype_mcost FOREIGN KEY (m_costtype_id)
    REFERENCES  m_costtype(m_costtype_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	ALTER TABLE  m_cost
  ADD CONSTRAINT mproduct_mcost FOREIGN KEY (m_product_id)
    REFERENCES  m_product(m_product_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	/* CREATE TABLE  m_product_acct_new */ 
	
		CREATE TABLE  m_product_acct_new (
  m_product_id NUMERIC(10,0) NOT NULL,
  c_acctschema_id NUMERIC(10,0) NOT NULL,
  ad_client_id NUMERIC(10,0) NOT NULL,
  ad_org_id NUMERIC(10,0) NOT NULL,
  isactive CHAR(1) DEFAULT 'Y'::bpchar NOT NULL,
  created TIMESTAMP WITHOUT TIME ZONE DEFAULT now() NOT NULL,
  createdby NUMERIC(10,0) NOT NULL,
  updated TIMESTAMP WITHOUT TIME ZONE DEFAULT now() NOT NULL,
  updatedby NUMERIC(10,0) NOT NULL,
  p_revenue_acct NUMERIC(10,0) NOT NULL,
  p_expense_acct NUMERIC(10,0) NOT NULL,
  p_asset_acct NUMERIC(10,0) NOT NULL,
  p_purchasepricevariance_acct NUMERIC(10,0) NOT NULL,
  p_invoicepricevariance_acct NUMERIC(10,0) NOT NULL,
  p_cogs_acct NUMERIC(10,0) NOT NULL,
  p_tradediscountrec_acct NUMERIC(10,0) NOT NULL,
  p_tradediscountgrant_acct NUMERIC(10,0) NOT NULL,
  p_inventoryclearing_acct NUMERIC(10,0),
  p_costadjustment_acct NUMERIC(10,0),
  p_wip_acct NUMERIC(10,0),
  p_methodchangevariance_acct NUMERIC(10,0),
  p_usagevariance_acct NUMERIC(10,0),
  p_ratevariance_acct NUMERIC(10,0),
  p_mixvariance_acct NUMERIC(10,0),
  p_floorstock_acct NUMERIC(10,0),
  p_costofproduction_acct NUMERIC(10,0),
  p_labor_acct NUMERIC(10,0),
  p_burden_acct NUMERIC(10,0),
  p_outsideprocessing_acct NUMERIC(10,0),
  p_overhead_acct NUMERIC(10,0),
  p_scrap_acct NUMERIC(10,0),
  p_averagecostvariance_acct NUMERIC(10,0) DEFAULT NULL::numeric,
  m_product_acct_uu VARCHAR(36) DEFAULT NULL::character varying,
  p_landedcostclearing_acct NUMERIC(10,0) DEFAULT NULL::numeric,
  CONSTRAINT m_product_acct_new_pkey PRIMARY KEY(m_product_id, c_acctschema_id),
  CONSTRAINT m_product_acct_new_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT plandedcostclearingvc_mprodacc FOREIGN KEY (p_landedcostclearing_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED
) 
WITH (oids = false);

commit;

CREATE UNIQUE INDEX m_product_acct_new_uu_idx ON  m_product_acct_new
  USING btree (m_product_acct_uu COLLATE pg_catalog."default");
commit;

INSERT INTO  m_product_acct_new
SELECT * FROM ONLY  m_product_acct;

drop table  m_product_acct;
commit;
CREATE TABLE  m_product_acct (
  m_product_id NUMERIC(10,0) NOT NULL,
  c_acctschema_id NUMERIC(10,0) NOT NULL,
  ad_client_id NUMERIC(10,0) NOT NULL,
  ad_org_id NUMERIC(10,0) NOT NULL,
  isactive CHAR(1) DEFAULT 'Y'::bpchar NOT NULL,
  created TIMESTAMP WITHOUT TIME ZONE DEFAULT now() NOT NULL,
  createdby NUMERIC(10,0) NOT NULL,
  updated TIMESTAMP WITHOUT TIME ZONE DEFAULT now() NOT NULL,
  updatedby NUMERIC(10,0) NOT NULL,
  p_revenue_acct NUMERIC(10,0) NOT NULL,
  p_expense_acct NUMERIC(10,0) NOT NULL,
  p_asset_acct NUMERIC(10,0) NOT NULL,
  p_purchasepricevariance_acct NUMERIC(10,0) NOT NULL,
  p_invoicepricevariance_acct NUMERIC(10,0) NOT NULL,
  p_cogs_acct NUMERIC(10,0) NOT NULL,
  p_tradediscountrec_acct NUMERIC(10,0) NOT NULL,
  p_tradediscountgrant_acct NUMERIC(10,0) NOT NULL,
  p_inventoryclearing_acct NUMERIC(10,0),
  p_costadjustment_acct NUMERIC(10,0),
  p_wip_acct NUMERIC(10,0),
  p_methodchangevariance_acct NUMERIC(10,0),
  p_usagevariance_acct NUMERIC(10,0),
  p_ratevariance_acct NUMERIC(10,0),
  p_mixvariance_acct NUMERIC(10,0),
  p_floorstock_acct NUMERIC(10,0),
  p_costofproduction_acct NUMERIC(10,0),
  p_labor_acct NUMERIC(10,0),
  p_burden_acct NUMERIC(10,0),
  p_outsideprocessing_acct NUMERIC(10,0),
  p_overhead_acct NUMERIC(10,0),
  p_scrap_acct NUMERIC(10,0),
  p_averagecostvariance_acct NUMERIC(10,0) DEFAULT NULL::numeric,
  m_product_acct_uu VARCHAR(36) DEFAULT NULL::character varying,
  p_landedcostclearing_acct NUMERIC(10,0) DEFAULT NULL::numeric,
  CONSTRAINT m_product_acct_pkey PRIMARY KEY(m_product_id, c_acctschema_id),
  CONSTRAINT m_product_acct_isactive_check CHECK (isactive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT cacctschema_mproductacct FOREIGN KEY (c_acctschema_id)
    REFERENCES  c_acctschema(c_acctschema_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT m_product_m_product_acct FOREIGN KEY (m_product_id)
    REFERENCES  m_product(m_product_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT paveragecostvariance_mproducta FOREIGN KEY (p_averagecostvariance_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT pburden_mproductacct FOREIGN KEY (p_burden_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT pcostadjustment_mproductacct FOREIGN KEY (p_costadjustment_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT pcostofproduction_mproductacct FOREIGN KEY (p_costofproduction_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT pfloorstock_mproductacct FOREIGN KEY (p_floorstock_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT pinventoryclearing_mproductacc FOREIGN KEY (p_inventoryclearing_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT plabor_mproductacct FOREIGN KEY (p_labor_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT plandedcostclearingvc_mprodacc FOREIGN KEY (p_landedcostclearing_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT pmethodchangevariance_mproduct FOREIGN KEY (p_methodchangevariance_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT pmixvariance_mproductacct FOREIGN KEY (p_mixvariance_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT poutsideprocessing_mproductacc FOREIGN KEY (p_outsideprocessing_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT poverhead_mproductacct FOREIGN KEY (p_overhead_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT pratevariance_mproductacct FOREIGN KEY (p_ratevariance_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT pscrap_mproductacct FOREIGN KEY (p_scrap_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT pusagevariance_mproductacct FOREIGN KEY (p_usagevariance_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT pwip_mproductacct FOREIGN KEY (p_wip_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT vc_passet_mproduct FOREIGN KEY (p_asset_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT vc_pcogs_mproduct FOREIGN KEY (p_cogs_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT vc_pexpense_mproduct FOREIGN KEY (p_expense_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT vc_pinvoicepv_mproduct FOREIGN KEY (p_invoicepricevariance_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT vc_ppurchasepv_mproduct FOREIGN KEY (p_purchasepricevariance_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT vc_prevenue_mproduct FOREIGN KEY (p_revenue_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT vc_ptdiscountgrant_mproduct FOREIGN KEY (p_tradediscountgrant_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED,
  CONSTRAINT vc_ptdiscountrec_mproduct FOREIGN KEY (p_tradediscountrec_acct)
    REFERENCES  c_validcombination(c_validcombination_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED
) 
WITH (oids = false);
commit;
CREATE UNIQUE INDEX m_product_acct_uu_idx ON  m_product_acct
  USING btree (m_product_acct_uu COLLATE pg_catalog."default");
  commit;
INSERT INTO  m_product_acct
SELECT * FROM ONLY  m_product_acct_new;

drop table  m_product_acct_new;
commit;


/* t_aging */ 
delete from t_aging;

ALTER TABLE  t_aging
  ADD CONSTRAINT adpinstance_taging FOREIGN KEY (ad_pinstance_id)
    REFERENCES  ad_pinstance(ad_pinstance_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	commit;
	
	/*t_replenish*/ 
	
	delete from t_replenish;

ALTER TABLE  t_replenish
  ADD CONSTRAINT adpinstance_treplenish FOREIGN KEY (ad_pinstance_id)
    REFERENCES  ad_pinstance(ad_pinstance_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	
	
	/*t_report */
	
	delete from t_report;

ALTER TABLE  t_report
  ADD CONSTRAINT adpinstance_treport FOREIGN KEY (ad_pinstance_id)
    REFERENCES  ad_pinstance(ad_pinstance_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	/* t_reportstatement */ 
	delete from t_reportstatement;

ALTER TABLE  t_reportstatement
  ADD CONSTRAINT adpinstance_treportstatement FOREIGN KEY (ad_pinstance_id)
    REFERENCES  ad_pinstance(ad_pinstance_id)
    MATCH FULL
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
    
	/* t_spool */ 
	
	delete from t_spool;

ALTER TABLE  t_spool
  ADD CONSTRAINT adpinstance_tspool FOREIGN KEY (ad_pinstance_id)
    REFERENCES  ad_pinstance(ad_pinstance_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	/* t_transaction */ 
	
	delete from t_transaction;
ALTER TABLE  t_transaction
  ADD CONSTRAINT adpinstance_ttransaction FOREIGN KEY (ad_pinstance_id)
    REFERENCES  ad_pinstance(ad_pinstance_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	
	/* t_trialbalance */ 
	
	delete from t_trialbalance;
ALTER TABLE  t_trialbalance
  ADD CONSTRAINT ad_pinstance_t_trialbalance FOREIGN KEY (ad_pinstance_id)
    REFERENCES  ad_pinstance(ad_pinstance_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;

/* remove os pkey para as novas tabelas que serão criadas pelos scripts LBR */ 
		
ALTER TABLE  lbr_ncm
  DROP CONSTRAINT lbr_ncm_pkey RESTRICT;
  commit;  
ALTER TABLE  lbr_legalmessage
  DROP CONSTRAINT lbr_legalmessage_key RESTRICT;
  commit;  
ALTER TABLE  lbr_taxgroup
  DROP CONSTRAINT lbr_taxgroup_key RESTRICT;
  commit;  
ALTER TABLE  lbr_fiscalgroup_product
  DROP CONSTRAINT lbr_fiscalgroup_product_key RESTRICT;
  commit;
ALTER TABLE  lbr_fiscalgroup_bpartner
  DROP CONSTRAINT lbr_fiscalgroup_bpartner_key RESTRICT;
  commit;  
ALTER TABLE  lbr_productcategory
  DROP CONSTRAINT lbr_productcategory_key RESTRICT;
  commit;
ALTER TABLE  lbr_bpartnercategory
  DROP CONSTRAINT lbr_bpartnercategory_key RESTRICT;
  commit;  
ALTER TABLE  lbr_taxname
  DROP CONSTRAINT lbr_taxname_key RESTRICT;
  commit;   
ALTER TABLE  lbr_taxformula
  DROP CONSTRAINT lbr_taxformula_key RESTRICT;
  commit;  
ALTER TABLE  lbr_tax
  DROP CONSTRAINT lbr_tax_key RESTRICT;
  commit;   
ALTER TABLE  lbr_taxline
  DROP CONSTRAINT lbr_taxline_key RESTRICT;
  commit;    
ALTER TABLE  lbr_icmsmatrix
  DROP CONSTRAINT lbr_icmsmatrix_key RESTRICT;
  commit;
ALTER TABLE  lbr_issmatrix
  DROP CONSTRAINT lbr_issmatrix_key RESTRICT;
  commit;
ALTER TABLE  lbr_taxconfiguration
  DROP CONSTRAINT lbr_taxconfiguration_key RESTRICT;
  commit;  
ALTER TABLE  lbr_taxconfig_bpartner
  DROP CONSTRAINT lbr_taxconfig_bpartner_key RESTRICT;
  commit;  
ALTER TABLE  lbr_taxconfig_bpgroup
  DROP CONSTRAINT lbr_taxconfig_bpgroup_key RESTRICT;
  commit;    
ALTER TABLE  lbr_taxconfig_region
  DROP CONSTRAINT lbr_taxconfig_region_key RESTRICT;
  commit;
ALTER TABLE  lbr_taxconfig_product
  DROP CONSTRAINT lbr_taxconfig_product_key RESTRICT;
  commit;
ALTER TABLE  lbr_taxconfig_productgroup
  DROP CONSTRAINT lbr_taxconfig_productgroup_key RESTRICT;
  commit;
ALTER TABLE  lbr_cfop
  DROP CONSTRAINT lbr_cfop_key RESTRICT;
  commit;
ALTER TABLE  lbr_cfopline
  DROP CONSTRAINT lbr_cfopline_key RESTRICT;
  commit;
ALTER TABLE  lbr_notafiscal
  DROP CONSTRAINT lbr_notafiscal_key RESTRICT;
  commit;
ALTER TABLE  lbr_notafiscalline
  DROP CONSTRAINT lbr_notafiscalline_key RESTRICT;
  commit;
ALTER TABLE  lbr_digitalcertificate
  DROP CONSTRAINT lbr_digitalcertificate_key RESTRICT;
  commit;
ALTER TABLE  lbr_nfewebservice
  DROP CONSTRAINT lbr_nfewebservice_key RESTRICT;
  commit;
ALTER TABLE  lbr_boleto
  DROP CONSTRAINT lbr_boleto_key RESTRICT;
  commit;
/* fim remocao pkey */ 
  
/* alterada todos os nomes de tabelas LBR para lbr_nometabela_old para manter compatibilidade
com a nova versão do IDempiereLBR */ 
alter table LBR_ApuracaoICMS rename to LBR_ApuracaoICMS_old;
alter table LBR_ApuracaoICMSLine rename to LBR_ApuracaoICMSLine_old;
alter table LBR_ApuracaoIPI rename to LBR_ApuracaoIPI_old;
alter table LBR_ApuracaoIPILine rename to LBR_ApuracaoIPILine_old;
alter table LBR_AverageCost rename to LBR_AverageCost_old;
alter table LBR_AverageCostLine rename to LBR_AverageCostLine_old;
alter table LBR_Bank rename to LBR_Bank_old;
alter table LBR_BankInfo rename to LBR_BankInfo_old;
alter table LBR_Boleto rename to LBR_Boleto_old;
alter table LBR_BPartnerCategory rename to LBR_BPartnerCategory_old;
alter table LBR_CCe rename to LBR_CCe_old;
alter table LBR_CFOP rename to LBR_CFOP_old;
alter table LBR_CFOPLine rename to LBR_CFOPLine_old;
alter table LBR_CNAB rename to LBR_CNAB_old;
alter table LBR_DE rename to LBR_DE_old;
alter table LBR_DigitalCertificate rename to LBR_DigitalCertificate_old;
alter table LBR_DocPrint rename to LBR_DocPrint_old;
alter table LBR_DocPrintField rename to LBR_DocPrintField_old;
alter table LBR_DocType_Acct rename to LBR_DocType_Acct_old;
alter table LBR_FiscalGroup_BPartner rename to LBR_FiscalGroup_BPartner_old;
alter table LBR_FiscalGroup_Product rename to LBR_FiscalGroup_Product_old;
alter table LBR_Formula rename to LBR_Formula_old;
alter table LBR_ICMSBasis rename to LBR_ICMSBasis_old;
alter table LBR_ICMSMatrix rename to LBR_ICMSMatrix_old;
alter table LBR_ISSMatrix rename to LBR_ISSMatrix_old;
alter table LBR_LegalMessage rename to LBR_LegalMessage_old;
alter table LBR_MatrixPrinter rename to LBR_MatrixPrinter_old;
alter table LBR_NCM rename to LBR_NCM_old;
alter table LBR_NCMIVA rename to LBR_NCMIVA_old;
alter table LBR_NCMTax rename to LBR_NCMTax_old;
alter table LBR_NFDI rename to LBR_NFDI_old;
alter table LBR_NFeLot rename to LBR_NFeLot_old;
alter table LBR_NFeWebService rename to LBR_NFeWebService_old;
alter table LBR_NFLineTax rename to LBR_NFLineTax_old;
alter table LBR_NFTax rename to LBR_NFTax_old;
alter table LBR_NotaFiscal rename to LBR_NotaFiscal_old;
alter table LBR_NotaFiscalLine rename to LBR_NotaFiscalLine_old;
alter table LBR_OtherNF rename to LBR_OtherNF_old;
alter table LBR_OtherNFLine rename to LBR_OtherNFLine_old;
alter table LBR_OtherNFLink rename to LBR_OtherNFLink_old;
alter table LBR_ProcessLink rename to LBR_ProcessLink_old;
alter table LBR_ProductCategory rename to LBR_ProductCategory_old;
alter table LBR_Tax rename to LBR_Tax_old;
alter table LBR_TaxConfig_BPartner rename to LBR_TaxConfig_BPartner_old;
alter table LBR_TaxConfig_BPGroup rename to LBR_TaxConfig_BPGroup_old;
alter table LBR_TaxConfig_Product rename to LBR_TaxConfig_Product_old;
alter table LBR_TaxConfig_ProductGroup rename to LBR_TaxConfig_ProductGroup_old;
alter table LBR_TaxConfig_Region rename to LBR_TaxConfig_Region_old;
alter table LBR_TaxConfiguration rename to LBR_TaxConfiguration_old;
alter table LBR_TaxDefinition rename to LBR_TaxDefinition_old;
alter table LBR_TaxFormula rename to LBR_TaxFormula_old;
alter table LBR_TaxGroup rename to LBR_TaxGroup_old;
alter table LBR_TaxIncludedList rename to LBR_TaxIncludedList_old;
alter table LBR_TaxLine rename to LBR_TaxLine_old;
alter table LBR_TaxName rename to LBR_TaxName_old;
alter table LBR_TaxStatus rename to LBR_TaxStatus_old;

/* *************************************************************************
	processo de exclusao de dados das tabelas 'LBR_*'
	ad_menu
	ad_tab
	ad_window
	ad_Field
	ad_element
	ad_column
	ad_table
	ad_process
	ad_rule
	ad_form
	ad_infocolumn
************************************************************************** */
delete from ad_menu where  entitytype = 'LBRA'; --menu
delete from ad_Field where  entitytype = 'LBRA'; -- field 
delete from ad_tab where  entitytype = 'LBRA'; -- tab
delete from ad_ref_table e where e.entitytype = 'LBRA'; -- ref table

delete from ad_field e where e.ad_column_id in 
(select ad_column_id from ad_column e where e.entitytype = 'LBRA'); -- field vinculados com column id

delete from ad_field e where e.ad_column_id in 
(select ad_column_id from ad_column e where e.ad_reference_value_id in 
(select ad_reference_id from ad_reference e where e.entitytype = 'LBRA')); -- field vinculados com reference id

delete from ad_column e where e.ad_reference_value_id in 
(select ad_reference_id from ad_reference e where e.entitytype = 'LBRA'); -- columns vinculados com reference id

delete from ad_reference e where e.entitytype = 'LBRA'; -- reference id
delete from ad_ref_list e where e.entitytype = 'LBRA'; -- ref list
delete from ad_pinstance a where a.ad_process_id in (
select ad_process_id from ad_process where entitytype = 'LBRA'); -- p instance id vinculados com process id

delete from ad_process where  entitytype = 'LBRA'; -- process id

delete from ad_tab e where e.ad_table_id in (
select ad_table_id from ad_table a where a.entitytype = 'LBRA'); -- tab

delete from ad_recentitem e where e.ad_table_id in 
(select ad_table_id from ad_table a where a.entitytype = 'LBRA'); -- recent item vinculados com tabelas lbr

delete from ad_changelog a where a.ad_column_id in 
(select ad_column_id from ad_Column where entitytype = 'LBRA'); --changelogs vinculados com column id lbr

delete from ad_changelog a where a.ad_table_id in 
(select ad_table_id from ad_table where entitytype = 'LBRA'); -- changelogs vinculados com tabelas lbr

delete from ad_preference e where e.ad_window_id in 
(select ad_window_id from ad_window a where a.entitytype = 'LBRA'); -- preference id vinculados com janelas

delete from ad_preference e where e.ad_process_id in 
(select ad_process_id from ad_process a where a.entitytype = 'LBRA'); -- preference vinculados com process id

delete from r_request e where e.ad_table_id in 
(select ad_table_id from ad_table a where a.entitytype = 'LBRA'); -- requests vinculados com tabelas lbr 

delete from ad_archive a where a.ad_table_id in 
(select ad_table_id from ad_table a where a.entitytype = 'LBRA'); -- archive vinculados com tabelas lbr

delete from ad_attachment a where a.ad_table_id in 
(select ad_table_id from ad_table a where a.entitytype = 'LBRA'); -- attachements vinculados com tabelas lbr

-- object recreation
-- remove a constrain caso exista e cria uma nova com ON DELETE CASCADE para deletar as traducoes tambem
ALTER TABLE  ad_printformat_trl
  DROP CONSTRAINT adprintformat_trl RESTRICT;
commit;
ALTER TABLE  ad_printformat_trl
  ADD CONSTRAINT adprintformat_trl FOREIGN KEY (ad_printformat_id)
    REFERENCES  ad_printformat(ad_printformat_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
    commit;
delete from ad_printformat e where e.ad_table_id in 
(select ad_table_id from ad_table a where a.entitytype = 'LBRA'); -- delete printformat

delete from ad_wf_activity e where e.ad_table_id in 
(select ad_table_id from ad_table a where a.entitytype = 'LBRA'); -- delete workflow activity 

delete from ad_wf_eventaudit e where e.ad_table_id in 
(select ad_table_id from ad_table a where a.entitytype = 'LBRA'); -- delete workflow eventaudit

delete from ad_wf_process e where e.ad_table_id in 
(select ad_table_id from ad_table a where a.entitytype = 'LBRA'); -- delete workflow process id

delete from ad_workflow e where e.ad_table_id in 
(select ad_table_id from ad_table a where a.entitytype = 'LBRA'); -- delete workflows

delete from ad_table a where a.ad_window_id in 
(select ad_window_id from ad_window e where e.entitytype = 'LBRA'); -- delete tables lbr

delete from ad_window where  entitytype = 'LBRA'; -- delete windows janelas lbr
delete from ad_table where  entitytype = 'LBRA'; -- delete tabelas lbr 
delete from ad_column where  entitytype = 'LBRA'; -- deleta colunas lbr

delete from ad_field a where a.ad_column_id in 
(select ad_column_id from ad_column a where a.ad_element_id in 
(select ad_element_id from ad_element a where a.entitytype = 'LBRA')); -- deleta fields vinculados com elementos lbr

delete from ad_column e where e.ad_element_id in 
(select ad_element_id from ad_element a where a.entitytype = 'LBRA'); -- deleta colunas vinculadas com elementos lbr

delete from ad_process_para a where a.ad_element_id in (
select ad_element_id from ad_element a where a.entitytype = 'LBRA'); -- deleta processos vinculados com elementos lbr

select  from ad_process_para a where a.entitytype = 'LBRA'; -- deleta parametro de processos LBR
delete from ad_element where  entitytype = 'LBRA'; -- deleta elementos LBR
delete from ad_pinstance a where a.ad_process_id in (
select ad_process_id from ad_process where entitytype = 'LBRA'); -- deleta pinstance id vinculados com processos lbr
delete from ad_process where  entitytype = 'LBRA'; -- deleta processos lbr
delete from ad_rule where  entitytype = 'LBRA'; -- deleta rules lbr
-- object recreation
-- dropa e recria constrain caso exista, cria ON DELETE CASCADE para traducoes de formularios.
ALTER TABLE  ad_form_trl
  DROP CONSTRAINT adform_adformtrl RESTRICT;
commit;
ALTER TABLE  ad_form_trl
  ADD CONSTRAINT adform_adformtrl FOREIGN KEY (ad_form_id)
    REFERENCES  ad_form(ad_form_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
commit;
delete from ad_form a where  a.entitytype = 'LBRA'; -- deleta formularios LBR
delete from ad_infocolumn where  entitytype = 'LBRA'; -- deleta infocolumns LBR
delete from ad_element where ad_element_id = 2000171; -- delete elemento que sobrou com nome LBR

-- object recreation
-- alterada constrain adfieldgroup_trl para ON DELETE CASCADE
ALTER TABLE  ad_fieldgroup_trl
  DROP CONSTRAINT adfieldgroup_trl RESTRICT;
commit;
ALTER TABLE  ad_fieldgroup_trl
  ADD CONSTRAINT adfieldgroup_trl FOREIGN KEY (ad_fieldgroup_id)
    REFERENCES  ad_fieldgroup(ad_fieldgroup_id)
    MATCH FULL
    ON DELETE CASCADE
    ON UPDATE NO ACTION
    DEFERRABLE
    INITIALLY DEFERRED;
	commit;
delete from ad_Fieldgroup e where e.entitytype = 'LBRA';
delete from ad_message e where e.entitytype = 'LBRA';
delete from ad_modelvalidator where entitytype = 'LBRA';
delete from ad_sysconfig where entitytype = 'LBRA';
delete from ad_val_rule where entitytype = 'LBRA';
delete from ad_entitytype where ad_entitytype.entitytype = 'LBRA';
DELETE FROM AD_REFERENCE WHERE AD_REFERENCE_ID = 1120031;
delete from ad_sequence e  where e.name like '%LBR%';

update ad_column set callout = 'org.compiere.model.CalloutOrder.product' where ad_column_id = 2221;
update ad_column set callout = 'org.compiere.model.CalloutOrder.bPartner' where ad_column_id = 2762;
update ad_column set callout = 'org.compiere.model.CalloutInvoice.bPartner' where ad_column_id =3499;
update ad_column set callout = 'org.compiere.model.CalloutInvoice.product' where ad_column_id = 3840;
update ad_process set classname = 'org.idempierelbr.nfe.process.GenerateDanfe' where ad_process_id = 2000040;
update ad_process set classname = 'br.com.palmetal.core.process.StatusRemessa' where ad_process_id = 2000003;
update ad_process set classname = 'br.com.palmetal.core.process.AvisaClienteColetado' where ad_process_id = 2000032;
update ad_process set classname = 'br.com.palmetal.core.process.AvisaClienteAutorizado' where ad_process_id = 2000031;
update ad_process set classname = 'br.com.palmetal.core.process.StatusFabricacao' where ad_process_id = 2000001;
update ad_process set classname = 'br.com.palmetal.core.process.EnviaEmailNF' where ad_process_id = 2000047;
update ad_process set classname = 'br.com.palmetal.core.process.StatusFaturamento' where ad_process_id = 2000002;
update ad_process set classname = 'br.com.palmetal.core.process.DesalocaOS' where ad_process_id = 2000007;
update ad_process set classname = 'br.com.palmetal.core.process.StatusPago' where ad_process_id = 2000005;
update ad_process set classname = 'br.com.palmetal.core.process.StatusPagamento' where ad_process_id = 2000004;
