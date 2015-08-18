-- 13/01/2014 15h9min24s BRST
-- Criação do campo NCM na tela Produto, e criação da NCM Info
INSERT INTO AD_Column (SeqNoSelection,IsSyncDatabase,Version,AD_Column_ID,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,IsKey,IsAutocomplete,IsAllowLogging,AD_Column_UU,IsUpdateable,ColumnName,Description,Name,IsAllowCopy,Updated,CreatedBy,IsActive,Created,UpdatedBy,IsToolbarButton,IsAlwaysUpdateable,AD_Client_ID,IsEncrypted,IsSecure,FKConstraintType,AD_Element_ID,AD_Reference_ID,AD_Table_ID,AD_Org_ID,EntityType) VALUES (0,'N',0,1000029,'N','N','N',0,'N',22,'N','N','N','Y','0012edbd-5e0e-482f-8028-548099f3bea3','N','LBR_NCM_ID','NCM stands for Nomenclatura Comum do MERCOSUL','NCM','Y',TO_TIMESTAMP('2014-01-13 15:09:23','YYYY-MM-DD HH24:MI:SS'),0,'Y',TO_TIMESTAMP('2014-01-13 15:09:23','YYYY-MM-DD HH24:MI:SS'),0,'N','N',0,'N','N','N',1000012,30,208,0,'LBR')
;

-- 13/01/2014 15h9min34s BRST
UPDATE AD_Column SET FKConstraintName='LBRNCM_MProduct', FKConstraintType='N',Updated=TO_TIMESTAMP('2014-01-13 15:09:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=1000029
;

-- 13/01/2014 15h9min34s BRST
ALTER TABLE M_Product ADD COLUMN LBR_NCM_ID NUMERIC(10) DEFAULT NULL 
;

/* Data for the 'lbr_ncm' table  (Records 1 - 7) */

INSERT INTO lbr_ncm ("lbr_ncm_id", "ad_org_id", "ad_client_id", "isactive", "created", "createdby", "updated", "updatedby", "value", "description", "lbr_tax_id", "lbr_hassubstitution")
VALUES (2000000, 2000000, 2000000, E'Y', E'2012-06-25 16:14:06', 100, E'2013-07-09 11:17:21', 100, E'7222.40.90', E'Barras e perfis, de aço inoxidável.\nOutros', 2000820, E'N');

INSERT INTO lbr_ncm ("lbr_ncm_id", "ad_org_id", "ad_client_id", "isactive", "created", "createdby", "updated", "updatedby", "value", "description", "lbr_tax_id", "lbr_hassubstitution")
VALUES (2000002, 2000000, 2000000, E'Y', E'2013-06-24 09:58:03', 100, E'2013-06-24 09:58:13', 100, E'7309.00.90', E'Reservatórios, tonéis, cubas e recipientes semelhantes para quaisquer matérias (exceto gases comprimidos ou liquefeitos), de ferro fundido, ferro ou aço, de capacidade superior a 300 litros, sem dispositivos mecânicos ou térmicos... \nOutros', 2000821, E'N');

INSERT INTO lbr_ncm ("lbr_ncm_id", "ad_org_id", "ad_client_id", "isactive", "created", "createdby", "updated", "updatedby", "value", "description", "lbr_tax_id", "lbr_hassubstitution")
VALUES (2000003, 2000000, 2000000, E'Y', E'2013-06-24 09:59:01', 100, E'2013-06-24 09:59:09', 100, E'7219.14.00', E'Produtos laminados planos de aço inoxidável,\nde largura igual ou superior a 600mm.\nDe espessura inferior a 3mm', 2000822, E'N');

INSERT INTO lbr_ncm ("lbr_ncm_id", "ad_org_id", "ad_client_id", "isactive", "created", "createdby", "updated", "updatedby", "value", "description", "lbr_tax_id", "lbr_hassubstitution")
VALUES (2000004, 2000000, 2000000, E'Y', E'2013-06-24 10:18:20', 100, E'2013-06-24 10:18:29', 100, E'7220.20.90', E'Produtos laminados planos de aço inoxidável,\n de largura in-ferior a 600mm.\nOutros', 2000823, E'N');

INSERT INTO lbr_ncm ("lbr_ncm_id", "ad_org_id", "ad_client_id", "isactive", "created", "createdby", "updated", "updatedby", "value", "description", "lbr_tax_id", "lbr_hassubstitution")
VALUES (2000005, 2000000, 2000000, E'Y', E'2013-06-24 10:19:38', 100, E'2013-06-24 10:19:47', 100, E'7309.00.90 ', E'Reservatórios, tonéis, cubas e recipientes semelhantes para quaisquer matérias (exceto gases comprimidos ou liquefeitos), de ferro fundido, ferro ou aço, de capacidade superior\na 300 litros, sem dispositivos mecânicos ou térmicos, mesmo com...\nOutros', 2000824, E'N');

INSERT INTO lbr_ncm ("lbr_ncm_id", "ad_org_id", "ad_client_id", "isactive", "created", "createdby", "updated", "updatedby", "value", "description", "lbr_tax_id", "lbr_hassubstitution")
VALUES (2000006, 2000000, 2000000, E'Y', E'2013-06-24 10:20:54', 100, E'2013-06-24 10:21:02', 100, E'7310.10.90', E'Reservatórios, barris, tambores, latas, caixas e recipientes semelhantes para quaisquer matérias (exceto gases comprimidos ou liquefeitos), de ferro fundido, ferro ou aço, de\ncapacidade não superior a 300 litros, sem dispositivos mecânicos ou térm...\nOutr', 2000825, E'N');

INSERT INTO lbr_ncm ("lbr_ncm_id", "ad_org_id", "ad_client_id", "isactive", "created", "createdby", "updated", "updatedby", "value", "description", "lbr_tax_id", "lbr_hassubstitution")
VALUES (2000007, 2000000, 2000000, E'Y', E'2014-10-29 17:10:05', 100, E'2014-10-29 17:10:05', 100, E'7310.29.90', E'Reservatórios, barris, tambores, latas, caixas e recipientes semelhantes para quaisquer matérias (exceto gases comprimidos ou liquefeitos), de ferro fundido, ferro ou aço, de capacidade não superior a 300 l, sem dispositivos mecânicos ou térmicos, mesmo c', 2016403, E'N');

-- 13/01/2014 15h9min36s BRST
ALTER TABLE M_Product ADD CONSTRAINT LBRNCM_MProduct FOREIGN KEY (LBR_NCM_ID) REFERENCES lbr_ncm(lbr_ncm_id) DEFERRABLE INITIALLY DEFERRED
;

-- 13/01/2014 15h18min10s BRST
INSERT INTO AD_Field (SortNo,IsEncrypted,AD_Tab_ID,DisplayLength,IsSameLine,IsHeading,SeqNo,IsCentrallyMaintained,AD_Field_ID,IsReadOnly,DisplayLogic,EntityType,Description,Name,AD_Field_UU,IsFieldOnly,IsDisplayed,UpdatedBy,AD_Org_ID,Created,CreatedBy,Updated,IsActive,IsDisplayedGrid,SeqNoGrid,XPosition,IsQuickEntry,AD_Client_ID,ColumnSpan,NumLines,IsAdvancedField,IsDefaultFocus,AD_Column_ID) VALUES (0,'N',180,0,'Y','N',580,'Y',1000025,'N','@ProductType@=''I''','LBR','NCM stands for Nomenclatura Comum do MERCOSUL','NCM','dcaa22a0-92c7-4008-85ab-4f5ab1dab85d','N','Y',0,0,TO_TIMESTAMP('2014-01-13 15:18:10','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2014-01-13 15:18:10','YYYY-MM-DD HH24:MI:SS'),'Y','Y',590,4,'N',0,2,1,'N','N',1000029)
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=1000025
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=1025
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=2587
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=5888
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=6129
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=1032
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=1031
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=201343
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=6841
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=10411
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=1026
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=200294
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=200295
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=200296
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=200297
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=7646
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=1319
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=1320
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=1321
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=1322
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3743
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3746
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3747
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3744
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3745
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=1027
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=1028
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=1568
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=1569
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=5381
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=5383
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=12418
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=5910
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=9286
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=5911
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=6130
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=8307
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=6343
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=6344
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=58973
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=8608
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=8613
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=52015
;

-- 13/01/2014 15h19min4s BRST
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=52016
;

-- 13/01/2014 15h23min10s BRST
UPDATE AD_Column SET IsUpdateable='Y',Updated=TO_TIMESTAMP('2014-01-13 15:23:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=1000029
;

-- 13/01/2014 15h38min24s BRST
INSERT INTO AD_InfoWindow (Processing,FromClause,AD_InfoWindow_UU,AD_InfoWindow_ID,EntityType,Name,AD_Org_ID,Created,Updated,UpdatedBy,CreatedBy,IsActive,OrderByClause,IsDefault,IsValid,IsDistinct,AD_Client_ID,AD_Table_ID,SeqNo,IsShowInDashboard) VALUES ('N','LBR_NCM a','a686dbb7-c462-48ef-b949-0f166e9780f0',1000000,'LBR','NCM Info',0,TO_TIMESTAMP('2014-01-13 15:38:24','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2014-01-13 15:38:24','YYYY-MM-DD HH24:MI:SS'),0,0,'Y','a.Value','Y','Y','N',0,1000000,20,'N')
;

-- 13/01/2014 15h39min17s BRST
INSERT INTO AD_InfoColumn (Help,SeqNo,AD_InfoColumn_UU,AD_InfoColumn_ID,IsQueryCriteria,EntityType,Description,Created,CreatedBy,Updated,AD_Org_ID,UpdatedBy,Name,IsCentrallyMaintained,ColumnName,IsDisplayed,IsActive,QueryFunction,QueryOperator,SelectClause,SeqNoSelection,IsIdentifier,AD_Client_ID,AD_Element_ID,AD_InfoWindow_ID,AD_Reference_ID) VALUES ('A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).',10,'4feff430-7a97-4909-9c50-87058dc76b0d',1000003,'Y','LBR','Search key for the record in the format required - must be unique',TO_TIMESTAMP('2014-01-13 15:39:17','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2014-01-13 15:39:17','YYYY-MM-DD HH24:MI:SS'),0,0,'Search Key','Y','Value','Y','Y','Upper','Like','a.Value',0,'Y',0,620,1000000,10)
;

-- 13/01/2014 15h41min27s BRST
INSERT INTO AD_InfoColumn (Help,SeqNo,AD_InfoColumn_UU,AD_InfoColumn_ID,IsQueryCriteria,EntityType,Description,Created,CreatedBy,Updated,AD_Org_ID,UpdatedBy,Name,IsCentrallyMaintained,ColumnName,IsDisplayed,IsActive,QueryFunction,QueryOperator,SelectClause,SeqNoSelection,IsIdentifier,AD_Client_ID,AD_Element_ID,AD_InfoWindow_ID,AD_Reference_ID) VALUES ('A description is limited to 255 characters.',20,'0b9131ce-b43b-46ff-b5e8-46d235bcba12',1000004,'Y','LBR','Optional short description of the record',TO_TIMESTAMP('2014-01-13 15:41:27','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2014-01-13 15:41:27','YYYY-MM-DD HH24:MI:SS'),0,0,'Description','Y','Description','Y','Y','Upper','Like','a.Description',0,'N',0,275,1000000,34)
;

-- 13/01/2014 15h43min22s BRST
INSERT INTO AD_InfoColumn (Help,SeqNo,AD_InfoColumn_UU,AD_InfoColumn_ID,IsQueryCriteria,EntityType,Description,Created,CreatedBy,Updated,AD_Org_ID,UpdatedBy,Name,AD_Val_Rule_ID,IsCentrallyMaintained,ColumnName,IsDisplayed,IsActive,SelectClause,SeqNoSelection,IsIdentifier,AD_Client_ID,AD_Element_ID,AD_InfoWindow_ID,AD_Reference_ID) VALUES ('A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.',1,'3d8782f1-548b-47c2-bdd8-c45b9d5dcd77',1000005,'N','LBR','Client/Tenant for this installation.',TO_TIMESTAMP('2014-01-13 15:43:22','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2014-01-13 15:43:22','YYYY-MM-DD HH24:MI:SS'),0,0,'Client',129,'Y','AD_Client_ID','Y','Y','a.AD_Client_ID',0,'N',0,102,1000000,19)
;

-- 13/01/2014 15h43min38s BRST
INSERT INTO AD_InfoColumn (Help,SeqNo,AD_InfoColumn_UU,AD_InfoColumn_ID,IsQueryCriteria,EntityType,Description,Created,CreatedBy,Updated,AD_Org_ID,UpdatedBy,Name,AD_Val_Rule_ID,IsCentrallyMaintained,ColumnName,IsDisplayed,IsActive,SelectClause,SeqNoSelection,IsIdentifier,AD_Client_ID,AD_Element_ID,AD_InfoWindow_ID,AD_Reference_ID) VALUES ('An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.',2,'5da4e86b-1dfc-45d0-b1c6-b8a757b21e21',1000006,'N','LBR','Organizational entity within client',TO_TIMESTAMP('2014-01-13 15:43:38','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2014-01-13 15:43:38','YYYY-MM-DD HH24:MI:SS'),0,0,'Organization',104,'Y','AD_Org_ID','Y','Y','a.AD_Org_ID',0,'N',0,113,1000000,19)
;

SELECT lbr_register_migration_script('201401131607.sql') FROM dual
;
