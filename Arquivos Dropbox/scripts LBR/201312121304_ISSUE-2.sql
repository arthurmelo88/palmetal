-- Dec 12, 2013 1:04:27 PM BRST
-- ISSUE-2 Cidades brasileiras e códigos do IBGE
INSERT INTO AD_Element (ColumnName,AD_Element_ID,Help,Name,Description,PrintName,AD_Element_UU,Created,Updated,AD_Org_ID,CreatedBy,UpdatedBy,IsActive,AD_Client_ID,EntityType) VALUES ('LBR_CityCode',1000000,'Alguns recursos exigem este código (ex: Nota Fiscal Eletrônica)','Cód. Cidade (IBGE)','Código do município no IBGE','Cód. Cidade (IBGE)','2db1c9d3-13bf-4539-baa0-45ccfb09a7a3',TO_TIMESTAMP('2013-12-12 13:04:27','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2013-12-12 13:04:27','YYYY-MM-DD HH24:MI:SS'),0,0,0,'Y',0,'LBR')
;

-- Dec 12, 2013 1:07:27 PM BRST
INSERT INTO AD_Column (SeqNoSelection,IsSyncDatabase,Version,AD_Table_ID,AD_Column_ID,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,IsAutocomplete,IsAllowLogging,AD_Column_UU,IsUpdateable,ColumnName,Description,Help,Name,IsAllowCopy,Updated,CreatedBy,AD_Org_ID,IsActive,Created,UpdatedBy,IsToolbarButton,IsAlwaysUpdateable,AD_Client_ID,EntityType,IsEncrypted,AD_Element_ID,IsSecure,FKConstraintType) VALUES (0,'N',0,186,1000000,'N','N','N',0,'N',10,'N',10,'N','N','Y','3b0b1343-05ad-4aca-b4e1-3eb960d5e979','Y','LBR_CityCode','Código do município no IBGE','Alguns recursos exigem este código (ex: Nota Fiscal Eletrônica)','Cód. Cidade (IBGE)','Y',TO_TIMESTAMP('2013-12-12 13:07:27','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2013-12-12 13:07:27','YYYY-MM-DD HH24:MI:SS'),0,'N','N',0,'LBR','N',1000000,'N','N')
;

-- Dec 12, 2013 1:07:34 PM BRST
ALTER TABLE C_City ADD COLUMN LBR_CityCode VARCHAR(10) DEFAULT NULL 
;
-- c_city nao foram inseridos registros pois o banco de dados ja possuia todos os registros em sua sequencia especifica.