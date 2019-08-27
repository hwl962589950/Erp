/*==============================================================*/
/* Database name:  erp                                          */
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/8/26 9:34:29                            */
/*==============================================================*/


DROP DATABASE IF EXISTS ERP;

/*==============================================================*/
/* Database: erp                                                */
/*==============================================================*/
CREATE DATABASE ERP;

USE ERP;

/*==============================================================*/
/* Table: AccountMoneyDetail                                    */
/*==============================================================*/
CREATE TABLE AccountMoneyDetail
(
   storageid            INT(9) NOT NULL COMMENT '主键ID',
   storagedate          DATE COMMENT '单据日期',
   origintypes          VARCHAR(50) COMMENT '来源单别',
   originid             VARCHAR(20) COMMENT '来源单号',
   nowdate              DATE COMMENT '日期',
   clientsupply         VARCHAR(50) COMMENT '供货商名称',
   citationid           VARCHAR(50) COMMENT '供货商ID',
   formerlymoneys       FLOAT COMMENT '原单金额',
   nowadaysmoneys       FLOAT COMMENT '现行余额',
   enables              INT COMMENT '标识是否删除',
   PRIMARY KEY (storageid)
);

ALTER TABLE AccountMoneyDetail COMMENT '采购账款明细表';

/*==============================================================*/
/* Table: Checkdetail                                           */
/*==============================================================*/
CREATE TABLE Checkdetail
(
   Dcheid               VARCHAR(20) COMMENT '单据号码',
   Dchelineid           INT(11) NOT NULL COMMENT '栏号',
   Dchematerielid       VARCHAR(50) COMMENT '物料的编号',
   DcheunitnameDchematerielname VARCHAR(50) COMMENT '物料的名称',
   Dcheunitname         VARCHAR(50) COMMENT '单位',
   Dcheaccountqty       INT(20) COMMENT '账面数量',
   Dchecheckqty         INT(20) COMMENT '盘点数量',
   Dcheprofitandlossqty INT(20) COMMENT '盈亏数量',
   Dcheprofitandlossmoney INT(20) COMMENT '盈亏金额',
   Dcheprice            INT(20) COMMENT '单价',
   Dcheremark           VARCHAR(50) COMMENT '备注',
   Done                 VARCHAR(50) COMMENT '保留字段',
   Dtwo                 VARCHAR(50) COMMENT '保留字段',
   DMovespectype        VARCHAR(50) COMMENT '规格型号',
   PRIMARY KEY (Dchelineid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='收款冲款主表';

ALTER TABLE Checkdetail COMMENT '盘点明细表';

/*==============================================================*/
/* Table: Currencytype                                          */
/*==============================================================*/
CREATE TABLE Currencytype
(
   CurrencyId           VARCHAR(50) NOT NULL COMMENT '币别编号',
   CurrencyName         VARCHAR(50) COMMENT '币别名称',
   ShorName             VARCHAR(50)  COMMENT '币别简称',
   EngName              VARCHAR(50) COMMENT '英文名称',
   ModifyDate           VARCHAR(50)  COMMENT '异动日期',
   FixedRate            FLOAT COMMENT '固定汇率',
   BuyInRate            FLOAT COMMENT '买进汇率',
   SellOutRate          FLOAT COMMENT '卖出汇率',
   PricedDeciDigits     FLOAT COMMENT '单价位数',
   PriceThouPt          FLOAT COMMENT '千位逗号',
   AmountDeciDi         FLOAT COMMENT '金额位数',
   AmountThoupt         FLOAT COMMENT '千位逗号',
   PRIMARY KEY (CurrencyId)
);

ALTER TABLE Currencytype COMMENT '币别';

/*==============================================================*/
/* Table: MovePrice                                             */
/*==============================================================*/
CREATE TABLE MovePrice
(
   movedate             DATE COMMENT '单据日期',
   moveorderNo          VARCHAR(50) NOT NULL COMMENT '单据号码',
   moveadjust           VARCHAR(50) COMMENT '增值科目',
   movestorageNo        VARCHAR(50) COMMENT '仓库编号',
   movemake             VARCHAR(50) COMMENT '制单人员
            ',
   movecheck            VARCHAR(50) COMMENT '复核人员',
   moveremark           VARCHAR(50) COMMENT '备注',
   moveAuditingState    INT(11) COMMENT '审核状态',
   safetyone            VARCHAR(50) COMMENT '保留字段',
   safetytwo            VARCHAR(20) COMMENT '保留字段',
   Moveadjian           VARCHAR(50) COMMENT '减值科目',
   PRIMARY KEY (moveorderNo)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='销售退货主表';

ALTER TABLE MovePrice COMMENT '调价主表';

/*==============================================================*/
/* Table: MovePriceDetail                                       */
/*==============================================================*/
CREATE TABLE MovePriceDetail
(
   Moveinile            INT(11) NOT NULL COMMENT '行号',
   moveorderNo          VARCHAR(50) COMMENT '单据号码',
   Movematerielno       VARCHAR(50) COMMENT '物料编号',
   Movematerielname     VARCHAR(50) COMMENT '物料名称',
   Movespectype         VARCHAR(50) COMMENT '规格型号',
   Moveunit             VARCHAR(50) COMMENT '单位',
   Movestocks           INT(11) COMMENT '库存量',
   moveaveragecost      INT(11) COMMENT '平均成本',
   moveprice            INT(11) COMMENT '单价',
   movemoveprice        INT(11) COMMENT '调价金额',
   safetyone            VARCHAR(50) COMMENT '保留字段',
   safetytwo            VARCHAR(50) COMMENT '保留字段',
   PRIMARY KEY (Moveinile)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='销售出库主表';

ALTER TABLE MovePriceDetail COMMENT '调价明细表';

/*==============================================================*/
/* Table: RevenueChargeType                                     */
/*==============================================================*/
CREATE TABLE RevenueChargeType
(
   FareClassId          VARCHAR(50) COMMENT '编号',
   FareClassName        VARCHAR(50) COMMENT '名称',
   EngName              VARCHAR(50) COMMENT '英文名称',
   AccSubjectId         VARCHAR(50) COMMENT '会计科目',
   AccSubjectName       VARCHAR(50) COMMENT '科目名称',
   Memo                 VARCHAR(50) COMMENT '备注'
);

ALTER TABLE RevenueChargeType COMMENT '收入费用类型';

/*==============================================================*/
/* Table: Stagnation                                            */
/*==============================================================*/
CREATE TABLE Stagnation
(
   Sid                  INT(20) NOT NULL COMMENT '主键ID',
   Sbh                  VARCHAR(50) COMMENT '物料编号',
   sname                VARCHAR(50) COMMENT '物料的名称',
   sxinghao             VARCHAR(50) COMMENT '规格型号',
   sleibiename          VARCHAR(50) COMMENT '类别名称',
   sdanweiname          VARCHAR(50) COMMENT '单位名称',
   sdata                DATE COMMENT '最近入库时间',
   son                  VARCHAR(50) COMMENT '备用1',
   stwo                 VARCHAR(50) COMMENT '备用2',
   sthree               VARCHAR(50) COMMENT '备用2',
   PRIMARY KEY (Sid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='销售退货明细表';

ALTER TABLE Stagnation COMMENT '库存呆滞分析表';

/*==============================================================*/
/* Table: advance                                               */
/*==============================================================*/
CREATE TABLE advance
(
   advid                VARCHAR(20) NOT NULL COMMENT '预付单单号',
   advdate              DATE COMMENT '单据日期',
   purveyid             VARCHAR(20) COMMENT '供应商ID',
   purveyname           VARCHAR(50) COMMENT '供应商名称',
   advstrike1           VARCHAR(50) COMMENT '结算方式1',
   advstrike2           VARCHAR(50) COMMENT '结算方式2',
   advstrike3           VARCHAR(50) COMMENT '结算方式3',
   advmoney1            FLOAT COMMENT '金额1',
   advmoney2            FLOAT COMMENT '金额2',
   advmoney3            FLOAT COMMENT '金额3',
   advmakeing           VARCHAR(50) COMMENT '制单人员',
   stodept              VARCHAR(50) COMMENT '制单人所属部门',
   stodeptid            VARCHAR(50) COMMENT '部门ID',
   advcheckman          VARCHAR(50) COMMENT '复核人员',
   advremark            VARCHAR(2000) COMMENT '备注',
   isaditing            INT(9) COMMENT '是否审核',
   safetyone            VARCHAR(50) COMMENT '保存（“预付款单”）',
   enables              INT COMMENT '标识是否删除',
   PRIMARY KEY (advid)
);

ALTER TABLE advance COMMENT '预付款主表
';

/*==============================================================*/
/* Table: advancedetails                                        */
/*==============================================================*/
CREATE TABLE advancedetails
(
   advid                VARCHAR(20) NOT NULL COMMENT '主表单号',
   advdetid             INT(9) COMMENT '行号',
   advdetmoney          FLOAT COMMENT '预付金额',
   advdetoddtype        VARCHAR(50) COMMENT '来源单别',
   advdetoddid          VARCHAR(20) COMMENT '来源单号',
   advdetdegest         VARCHAR(50) COMMENT '摘要',
   advdetbalance        FLOAT COMMENT '预付余额',
   enables              INT COMMENT '标识是否删除',
   PRIMARY KEY (advid)
);

ALTER TABLE advancedetails COMMENT '预付款明细表';

/*==============================================================*/
/* Table: advancegather                                         */
/*==============================================================*/
CREATE TABLE advancegather
(
   Billid               VARCHAR(20) NOT NULL COMMENT '单据号码',
   Billdate             DATE NOT NULL COMMENT '单据日期',
   Sinid                INT(11) NOT NULL COMMENT '单据类型singleType(sinId)',
   Cliid                VARCHAR(50) NOT NULL COMMENT '客户编号client(cliid)',
   Clishortname         VARCHAR(50) NOT NULL COMMENT '客户简称',
   Currencytype         VARCHAR(50) NOT NULL COMMENT '币别',
   Reckontypef          VARCHAR(50) NOT NULL COMMENT '结算方式一',
   Reckontypes          VARCHAR(50) NOT NULL COMMENT '结算方式一',
   Reckontypet          VARCHAR(50) NOT NULL COMMENT '结算方式一',
   Reckonmoneyf         FLOAT NOT NULL COMMENT '金额',
   Reckonmoneys         FLOAT NOT NULL COMMENT '金额',
   Reckonmoneyt         FLOAT NOT NULL COMMENT '金额',
   Gatherdiscount       FLOAT NOT NULL COMMENT '折扣率',
   Gatherendaccountmonth DATE NOT NULL COMMENT '终止帐月',
   Empid                VARCHAR(50) NOT NULL COMMENT '业务人员编号，也就是人员编号employee(empid)',
   Empname              VARCHAR(50) NOT NULL COMMENT '业务人员',
   Depid                VARCHAR(50) NOT NULL COMMENT '部门编号depttab(depid)',
   Depname              VARCHAR(50) NOT NULL COMMENT '所属部门',
   Makeempname          VARCHAR(50) NOT NULL COMMENT '制单人员',
   Auditingempname      VARCHAR(50) NOT NULL COMMENT '复核人员',
   Checkstate           INT(11) NOT NULL COMMENT '审核状态',
   Remark               VARCHAR(2000) NOT NULL COMMENT '备注',
   Enables              INT(11) NOT NULL COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Safetytwo            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Billid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='预收款主表';

/*==============================================================*/
/* Table: advancegatherdetails                                  */
/*==============================================================*/
CREATE TABLE advancegatherdetails
(
   Billid               VARCHAR(20) NOT NULL COMMENT '单据号码Advancegather(billId)',
   Cotemark             INT(11) NOT NULL COMMENT '栏号',
   Promisedmoney        FLOAT NOT NULL COMMENT '预收金额',
   Advancemoney         FLOAT NOT NULL COMMENT '预收余额',
   Sinname              VARCHAR(50) NOT NULL COMMENT '来源单别',
   Originbillid         VARCHAR(20) NOT NULL COMMENT '来源单号',
   Summary              VARCHAR(2000) NOT NULL COMMENT '摘要',
   Enables              INT(11) NOT NULL COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Safetytwo            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Billid, Cotemark)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='预收款明细表';

/*==============================================================*/
/* Table: apportiondetails                                      */
/*==============================================================*/
CREATE TABLE apportiondetails
(
   Adeid                VARCHAR(20) NOT NULL COMMENT '采?悍痔ズ?采购分摊外键)',
   Adesequ              INT(11) COMMENT '序号',
   Adeexesid            VARCHAR(50) COMMENT '费用编号',
   Adeexesname          VARCHAR(50) COMMENT '费用名称',
   Adeamtmoney          FLOAT COMMENT '金额',
   Enables              INT(11) COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Adeid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='采购分摊费用明细表';

/*==============================================================*/
/* Table: apportionresult                                       */
/*==============================================================*/
CREATE TABLE apportionresult
(
   Atiid                VARCHAR(20) NOT NULL COMMENT '采购分摊单号(采购分摊外键)',
   Storageid            VARCHAR(50) COMMENT '采购入库单',
   Matid                VARCHAR(50) COMMENT '物料编号',
   Matname              VARCHAR(50) COMMENT '物料名称',
   Matspec              VARCHAR(50) COMMENT '规格型号',
   Stockprice           FLOAT COMMENT '采购金额',
   Atinum               INT(11) COMMENT '数量',
   Ademoney             FLOAT COMMENT '分摊金额',
   Enables              INT(11) COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Atiid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='采购分摊结果';

/*==============================================================*/
/* Table: apportionwise                                         */
/*==============================================================*/
CREATE TABLE apportionwise
(
   Wisid                VARCHAR(20) NOT NULL COMMENT '分摊方式编号',
   Wisname              VARCHAR(50) COMMENT '分摊方式名称',
   Wisename             VARCHAR(50) COMMENT '英文名称',
   Wisremark            VARCHAR(2000) COMMENT '备注',
   Enables              INT(11) COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Wisid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='分摊方式表';

/*==============================================================*/
/* Table: calculateunit                                         */
/*==============================================================*/
CREATE TABLE calculateunit
(
   UnitId               VARCHAR(50) NOT NULL COMMENT '单位编号',
   UnitName             VARCHAR(50) COMMENT '单位名称',
   EngName              VARCHAR(50) COMMENT '英文名称',
   Memo                 VARCHAR(50) COMMENT '备注',
   PRIMARY KEY (UnitId)
);

ALTER TABLE calculateunit COMMENT '计量单位';

/*==============================================================*/
/* Table: checked                                               */
/*==============================================================*/
CREATE TABLE checked
(
   cheid                VARCHAR(20) NOT NULL COMMENT '单据号码',
   chestorageno         VARCHAR(20) COMMENT '盘点的仓库编号',
   chejian              VARCHAR(20) COMMENT '盘点人名称',
   chestoragename       VARCHAR(20) COMMENT '盘点的仓库名称',
   chedate              DATE COMMENT '盘点的日期',
   cheman               VARCHAR(20) COMMENT '盘点人名称',
   chedeptname          VARCHAR(20) COMMENT '部门名称',
   cherestrictman       VARCHAR(20) COMMENT '制单人-当前登录人',
   cheauditingman       VARCHAR(20) COMMENT '审核人-当前登录人',
   chestatu             INT(11) COMMENT '审核状态，0为未审核',
   chesone              VARCHAR(20) COMMENT '保留字段',
   chestwo              VARCHAR(20) COMMENT '保留字段',
   chejust              VARCHAR(20) COMMENT '增值科目',
   cjian                CHAR(10) COMMENT '减值科目',
   PRIMARY KEY (cheid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='预收款主表';

ALTER TABLE checked COMMENT '盘点主表';

/*==============================================================*/
/* Table: clashfund                                             */
/*==============================================================*/
CREATE TABLE clashfund
(
   Billid               VARCHAR(20) NOT NULL COMMENT '单据号码',
   Billdate             DATE NOT NULL COMMENT '单据日期',
   Sinid                INT(11) NOT NULL COMMENT '单据类型singleType(sinId)',
   Cliid                VARCHAR(50) NOT NULL COMMENT '客户编号client(cliid)',
   Clishortname         VARCHAR(50) NOT NULL COMMENT '客户简称',
   Currencytype         VARCHAR(50) NOT NULL COMMENT '币别',
   Reckontypef          VARCHAR(50) NOT NULL COMMENT '结算方式一',
   Reckontypes          VARCHAR(50) NOT NULL COMMENT '结算方式一',
   Reckontypet          VARCHAR(50) NOT NULL COMMENT '结算方式一',
   Reckonmoneyf         FLOAT NOT NULL COMMENT '金额',
   Reckonmoneys         FLOAT NOT NULL COMMENT '金额',
   Reckonmoneyt         FLOAT NOT NULL COMMENT '金额',
   Gatherdiscount       FLOAT NOT NULL COMMENT '折扣率',
   Gatherendaccountmonth DATE NOT NULL COMMENT '终止帐月',
   Empid                VARCHAR(50) NOT NULL COMMENT '业务人员编号，也就是人员编号employee(empid)',
   Empname              VARCHAR(50) NOT NULL COMMENT '业务人员',
   Depid                VARCHAR(50) NOT NULL COMMENT '部门编号depttab(depid)',
   Depname              VARCHAR(50) NOT NULL COMMENT '所属部门',
   Makeempname          VARCHAR(50) NOT NULL COMMENT '制单人员',
   Auditingempname      VARCHAR(50) NOT NULL COMMENT '复核人员',
   Checkstate           INT(11) NOT NULL COMMENT '审核状态',
   Remark               VARCHAR(2000) NOT NULL COMMENT '备注',
   Enables              INT(11) NOT NULL COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Safetytwo            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Billid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='收款冲款主表';

/*==============================================================*/
/* Table: clashfunddetailsone                                   */
/*==============================================================*/
CREATE TABLE clashfunddetailsone
(
   Billid               VARCHAR(20) NOT NULL COMMENT '单据号码clashfund(billId)',
   Cotemark             INT(11) NOT NULL COMMENT '栏号',
   Sinname              VARCHAR(50) NOT NULL COMMENT '来源单别(销售订单)',
   Originbillid         VARCHAR(20) NOT NULL COMMENT '来源单号',
   Originodddate        DATE NOT NULL COMMENT '原单日期',
   Originoddmoney       FLOAT NOT NULL COMMENT '原单金额',
   Currentlybalance     FLOAT NOT NULL COMMENT '现行余额',
   Discountmoney        FLOAT NOT NULL COMMENT '折让金额',
   Clashmoney           FLOAT NOT NULL COMMENT '冲款金额',
   Enables              INT(11) NOT NULL COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Safetytwo            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Billid, Cotemark)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='冲款款明细表';

/*==============================================================*/
/* Table: client                                                */
/*==============================================================*/
CREATE TABLE CLIENT
(
   cliId                VARCHAR(50) NOT NULL COMMENT '客户编号',
   clitypeid            VARCHAR(50) COMMENT '客户类别Id',
   cliName              VARCHAR(50) COMMENT '客户全称',
   clishortName         VARCHAR(50) COMMENT '客户简称',
   cliaddress           VARCHAR(50) COMMENT '地方（具体）',
   cliarea              VARCHAR(50) COMMENT '地区',
   cliename             VARCHAR(50) COMMENT '英文全称',
   clieshortname        VARCHAR(50) COMMENT '英文简称',
   cliprincipal         VARCHAR(50) COMMENT '负责人',
   clilinkman           VARCHAR(50) COMMENT '联系人',
   cliphoneone          VARCHAR(50) COMMENT '联系电话一',
   cliphonetow          VARCHAR(50) COMMENT '联系电话二',
   empid                VARCHAR(50) COMMENT '业务人员id',
   climobilephone       VARCHAR(50) COMMENT '移动电话',
   cliemail             VARCHAR(50) COMMENT '电子邮件',
   cliweb               VARCHAR(50) COMMENT '网址',
   clifaxes             VARCHAR(50) COMMENT '传真号码',
   clibankaccounts      VARCHAR(50) COMMENT '银行帐号',
   cliopenbank          VARCHAR(50) COMMENT '开户银行',
   PRIMARY KEY (cliId)
);

ALTER TABLE CLIENT COMMENT '客户主文件';

/*==============================================================*/
/* Table: clientaddress                                         */
/*==============================================================*/
CREATE TABLE clientaddress
(
   cliaddrId            VARCHAR(50) COMMENT '客户地址编号',
   cliaddress           VARCHAR(50) COMMENT '客户地址',
   clizipcode           VARCHAR(50) COMMENT '邮政编码',
   clilinkman           VARCHAR(50) COMMENT '联系人',
   clilinkmanprof       VARCHAR(50) COMMENT '联系人职称',
   clitelephone         VARCHAR(50) COMMENT '联系人电话',
   clifaxno             VARCHAR(50) COMMENT '传真号码',
   cliwalkaddr          VARCHAR(50) COMMENT '行走路线',
   climemo              VARCHAR(50) COMMENT '备注',
   cliid                INT(11)
);

ALTER TABLE clientaddress COMMENT '客户地址';

/*==============================================================*/
/* Table: clienttype                                            */
/*==============================================================*/
CREATE TABLE clienttype
(
   Clitypeid            VARCHAR(50) COMMENT '类别编号',
   Clitypename          VARCHAR(50) COMMENT '类别名称',
   Clitypeename         VARCHAR(50) COMMENT '英文名称',
   Cliremark            VARCHAR(50) DEFAULT NULL COMMENT '备注',
   Clitypetrash         INT(11) COMMENT '是否废码',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   ENABLE               INT(11) COMMENT '标识是否删除',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4'
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='客户类别表';

/*==============================================================*/
/* Table: depothead                                             */
/*==============================================================*/
CREATE TABLE depothead
(
   id                   INT NOT NULL,
   TYPE                 INT,
   subType              VARCHAR(50),
   customerId           INT,
   defaultNumber        VARCHAR(50),
   operPersonName       VARCHAR(50),
   operTime             DATETIME,
   createTime           DATETIME,
   address              VARCHAR(255),
   currency             VARCHAR(50),
   tax                  VARCHAR(1),
   exchangeRate         FLOAT,
   warehouse            VARCHAR(255),
   reRelease            VARCHAR(1),
   foreignTrade         VARCHAR(1),
   voucheId             VARCHAR(50),
   invoice              VARCHAR(1),
   attributionAccounts  VARCHAR(20),
   collectionDate       DATE,
   paymentConditions    VARCHAR(20),
   accountDay           VARCHAR(50),
   accountMonth         DATE,
   customColumn1        VARCHAR(50),
   CustomColumn2        VARCHAR(50),
   remark               TEXT,
   operationalPersonnel VARCHAR(50),
   subordinateDepartments VARCHAR(50),
   STATUS               VARCHAR(1),
   reviewPersonnel      VARCHAR(50),
   projectId            INT,
   PRIMARY KEY (id)
);

/*==============================================================*/
/* Table: depotheaddetails                                      */
/*==============================================================*/
CREATE TABLE depotheaddetails
(
   depotheadId          INT NOT NULL,
   NO                   INT NOT NULL,
   materialNumber       VARCHAR(50),
   materialName         VARCHAR(50),
   specificationType    VARCHAR(50),
   companyName          VARCHAR(50),
   number               INT,
   discounPric          FLOAT,
   foldingNumber        FLOAT,
   price                FLOAT,
   money                FLOAT,
   taxRate              FLOAT,
   taxAmount            FLOAT,
   taxableAmount        FLOAT,
   batchMumber          VARCHAR(1),
   materialCombination  VARCHAR(1),
   gift                 VARCHAR(1),
   invoiceDetails       VARCHAR(1),
   uninvoicedQuantity   INT,
   notesToEntries       TEXT,
   sourceList           VARCHAR(50),
   sourceNo             VARCHAR(50),
   customerOrders       VARCHAR(50),
   PRIMARY KEY (NO, depotheadId)
);

/*==============================================================*/
/* Table: depttab                                               */
/*==============================================================*/
CREATE TABLE depttab
(
   Depid                INT(11) NOT NULL COMMENT '部门编号',
   Depname              VARCHAR(50) NOT NULL COMMENT '部门名称',
   Depremark            VARCHAR(200) NOT NULL COMMENT '备注',
   Deptrash             VARCHAR(50) NOT NULL COMMENT '是否废码',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Depid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='部门表';

/*==============================================================*/
/* Table: dsdaArea                                              */
/*==============================================================*/
CREATE TABLE dsdaArea
(
   AreaId               VARCHAR(50)  NOT NULL COMMENT '地区编号',
   AreaName             VARCHAR(50)  COMMENT '地区名称',
   EngName              VARCHAR(50)  COMMENT '英文名称',
   Memo                 VARCHAR(50)  COMMENT '备注',
   PRIMARY KEY (AreaId)
);

ALTER TABLE dsdaArea COMMENT '地区';

/*==============================================================*/
/* Table: employee                                              */
/*==============================================================*/
CREATE TABLE employee
(
   Empid                VARCHAR(50) NOT NULL COMMENT '人员编号',
   Empname              VARCHAR(50) COMMENT '人员姓名',
   Empename             VARCHAR(50) COMMENT '英文姓名',
   Depid                VARCHAR(50) COMMENT '部门编号id',
   Empsex               VARCHAR(50) COMMENT '性别（默认男）',
   Empcard              VARCHAR(50) COMMENT '身份证号',
   Empstate             VARCHAR(50) COMMENT '就职状态id',
   Empduty              VARCHAR(50) COMMENT '职务（改字段名）',
   Empphoneone          VARCHAR(50) COMMENT '联系电话一',
   Empphonetwo          VARCHAR(50) COMMENT '联系电话二',
   Empphonethree        VARCHAR(50) COMMENT '联系电话三',
   Empbankaccounts      VARCHAR(50) COMMENT '银行账号',
   Empbirthday          DATE COMMENT '出生日期(修改数据类型)',
   Empjob               VARCHAR(50) COMMENT '岗位',
   Empemail             VARCHAR(50) COMMENT '电子邮件（一个邮箱）',
   Empweb               VARCHAR(50) COMMENT '网址',
   Empfaxes             VARCHAR(50) COMMENT '传真号码',
   Empopenbank          VARCHAR(50) COMMENT '开户银行',
   Emptop               VARCHAR(50) COMMENT '最高学历',
   Empdegree            VARCHAR(50) COMMENT '学位',
   Empgotime            DATE COMMENT '到期日期',
   Empgraduatetime      VARCHAR(50) COMMENT '毕业学校',
   Emppactstarttime     DATE COMMENT '合同起始日期',
   Emppactendtime       DATE COMMENT '合同终止日期',
   Empnowmailid         VARCHAR(50) COMMENT '现邮编',
   Empfamilyphone       VARCHAR(50) COMMENT '家庭电话',
   Empfamilyplace       VARCHAR(50) COMMENT '家庭住址',
   Empnowphone          VARCHAR(50) COMMENT '现电话',
   Empnowplace          VARCHAR(50) COMMENT '现住址',
   Empexigenceman       VARCHAR(50) COMMENT '紧急联系人',
   Empfamilymailid      VARCHAR(50) COMMENT '家庭邮编',
   Empremark            VARCHAR(200) COMMENT '备注',
   Emptrash             INT(11) COMMENT '是否废码',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   Enables              INT(11) COMMENT '标识是否删除',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Empid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='人员表';

/*==============================================================*/
/* Table: generalledger                                         */
/*==============================================================*/
CREATE TABLE generalledger
(
   Genid                VARCHAR(50) NOT NULL COMMENT '行号',
   genmaterielid        VARCHAR(50) COMMENT '物料编号',
   genstorageno         VARCHAR(50) COMMENT '仓库编号',
   genstoragename       VARCHAR(50) COMMENT '仓库名称',
   genexpectstartqty    VARCHAR(50) COMMENT '物料类别',
   genstandarcost       VARCHAR(50) COMMENT '单位',
   gone                 VARCHAR(50) COMMENT '保留字段',
   gtwo                 VARCHAR(50) COMMENT '保留字段',
   Genmaterielname      VARCHAR(50) COMMENT '物料名称',
   Xinghao              VARCHAR(50) COMMENT '规格型号',
   DATE                 DATE COMMENT '日期',
   PRIMARY KEY (Genid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='销售订单主表';

ALTER TABLE generalledger COMMENT '库存总账表';

/*==============================================================*/
/* Table: listofpurchaseinvoices                                */
/*==============================================================*/
CREATE TABLE listofpurchaseinvoices
(
   invoicelist          INT(9) NOT NULL COMMENT '发票清单表ID',
   lineint              INT COMMENT '行号',
   materialint          VARCHAR(50) COMMENT '物料编号',
   namematerial         VARCHAR(100) COMMENT '物料名称',
   specificationtype    VARCHAR(50) COMMENT '规格型号',
   company              VARCHAR(50) COMMENT '单位',
   invoicequantity      INT COMMENT '发票数量',
   invoiceunitprice     FLOAT COMMENT '发票单价',
   invoiceamount        FLOAT COMMENT '发票金额',
   invoicetaxrate       FLOAT COMMENT '发票税率%',
   invoicetax           FLOAT COMMENT '发票税额',
   invoicetaxableamount FLOAT COMMENT '发票含税金额',
   sinkdifference       FLOAT COMMENT '汇差',
   spread               FLOAT COMMENT '价差',
   standardcurrency     FLOAT COMMENT '价差本位币',
   totaldifference      FLOAT COMMENT '差额合计',
   sourcelist           VARCHAR(50) COMMENT '来源单别',
   sourceno             VARCHAR(50) COMMENT '来源单号',
   notestoentries       VARCHAR(100) COMMENT '分录备注',
   PRIMARY KEY (invoicelist)
);

ALTER TABLE listofpurchaseinvoices COMMENT '采购发票清单表';

/*==============================================================*/
/* Table: mainlistofpurchaseinvoices                            */
/*==============================================================*/
CREATE TABLE mainlistofpurchaseinvoices
(
   storageid            INT(9) NOT NULL COMMENT '发票主表ID',
   citationid           VARCHAR(50) COMMENT '供货商ID',
   clientsupply         VARCHAR(50) COMMENT '供货商名称',
   storagedate          DATE COMMENT '单据日期',
   documenttype         VARCHAR(50) COMMENT '单据类型',
   documentint          VARCHAR(50) COMMENT '单据号码',
   taxincluded          INT COMMENT '单价是否含税',
   invoiceint           VARCHAR(50) COMMENT '发票号码',
   checkstatus          VARCHAR(50) COMMENT '采购核对状态',
   invoicetype          INT COMMENT '发票类型',
   voucherint           VARCHAR(50) COMMENT '凭证编号',
   currency             VARCHAR(50) COMMENT '币别',
   CertificateNo        VARCHAR(50) COMMENT '差价凭证编号',
   exchangerate         FLOAT COMMENT '汇率',
   Purchaser            VARCHAR(50) COMMENT '采购人员',
   subordinatedepartments VARCHAR(50) COMMENT '所属部门',
   attributionofaccounts VARCHAR(50) COMMENT '账款归属',
   termofpayment        VARCHAR(100) COMMENT '付款条件',
   daysofpaymentterms   INT COMMENT '付款条件天数',
   dateofpayment        DATE COMMENT '付款日期',
   accountmonth         DATE COMMENT '账款月份',
   paystrike1           VARCHAR(50) COMMENT '结算方式1',
   paystrike2           VARCHAR(50) COMMENT '结算方式2',
   paystrike3           VARCHAR(50) COMMENT '结算方式3',
   paymoney1            FLOAT COMMENT '金额1',
   paymoney2            FLOAT COMMENT '金额2',
   paymoney3            FLOAT COMMENT '金额3',
   systempersonnel      VARCHAR(50) COMMENT '制单人员',
   reviewpersonne       VARCHAR(50) COMMENT '复核人员',
   subordinateprojects  VARCHAR(50) COMMENT '所属项目',
   enables              INT COMMENT '标识是否删除',
   isaditing            INT(9) COMMENT '是否审核',
   PRIMARY KEY (storageid)
);

ALTER TABLE mainlistofpurchaseinvoices COMMENT '采购发票表
';

/*==============================================================*/
/* Table: materiel                                              */
/*==============================================================*/
CREATE TABLE materiel
(
   Matid                VARCHAR(50) NOT NULL COMMENT '物料编号',
   Matname              VARCHAR(50) COMMENT '物料名称',
   Matspec              VARCHAR(50) COMMENT '规格型号',
   Mattypeid            VARCHAR(20) COMMENT '物料类别（伪外键）',
   Mattypename          VARCHAR(50) COMMENT '物料类别名称',
   Matadviceprice       FLOAT COMMENT '建议售价',
   Matadvicepricea      FLOAT COMMENT '售价A',
   Matadvicepriceb      FLOAT COMMENT '售价B',
   Matadvicepricec      FLOAT COMMENT '售价C',
   Matadvicepriced      FLOAT COMMENT '售价D',
   Matadvicepricee      FLOAT COMMENT '售价E',
   Matstandardprice     FLOAT COMMENT '标准进价',
   Matshape             VARCHAR(50) COMMENT '物料型态',
   Matifduty            INT(11) COMMENT '是否含税',
   Matdutyrate          FLOAT COMMENT '税率',
   Matstockaheaddate    INT(11) COMMENT '采购提前期',
   Matmainafford        VARCHAR(50) COMMENT '主供应商',
   Matmainaffordid      VARCHAR(50) COMMENT '主供应商ID',
   Matgawpdate          INT(11) COMMENT '呆滞起计天数',
   Matstopdate          DATE COMMENT '停用日期',
   Matremark            VARCHAR(2000) COMMENT '备注',
   Matunit              VARCHAR(50) COMMENT '计量单位',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   ENABLE               INT(11) COMMENT '标识是否删除',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Matid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='物料主文件';

/*==============================================================*/
/* Table: materieltype                                          */
/*==============================================================*/
CREATE TABLE materieltype
(
   Matypeid             VARCHAR(50) COMMENT '物料类别编号',
   Matypename           VARCHAR(50) COMMENT '物料类别名称',
   Matypeengname        VARCHAR(50) COMMENT '英文名称',
   Matyperemark         VARCHAR(2000) COMMENT '备注',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   Enables              INT(11) COMMENT '标识是否删除',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   Column_13            CHAR(10)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='物料类别';

/*==============================================================*/
/* Table: movedetails                                           */
/*==============================================================*/
CREATE TABLE movedetails
(
   DMdsno               INT(11) NOT NULL COMMENT '单号',
   DMdsmseno            VARCHAR(50) COMMENT '单据号码(单号)',
   Dmdsmaterieltype     VARCHAR(50) COMMENT '物料编号',
   Dmdsmaterielname     VARCHAR(50) COMMENT '物料名称',
   Dmdsmaterielspecs    VARCHAR(50) COMMENT '规格型号',
   Dmdsmaterielunit     VARCHAR(50) COMMENT '单位',
   Dmdsmaterielnum      VARCHAR(50) COMMENT '数量',
   DMdsremark           VARCHAR(50) COMMENT '备注',
   DMespreservingone    VARCHAR(50) COMMENT '保留字段1',
   Dmespreservingtwo    VARCHAR(50) COMMENT '保留字段2',
   Denables             INT(11) COMMENT '默认1使用，0：不使用	使用有效期',
   PRIMARY KEY (DMdsno)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='供应商主文件表';

ALTER TABLE movedetails COMMENT '调拨单明细表';

/*==============================================================*/
/* Table: movestorage                                           */
/*==============================================================*/
CREATE TABLE movestorage
(
   Mseno                INT(11) NOT NULL COMMENT '单据号码(单号)',
   msedate              DATE COMMENT '单据日期',
   Mseoutstorage        VARCHAR(50) COMMENT '调出库仓（仓库编号）',
   mseinsertstor        VARCHAR(50) COMMENT '调入库仓（仓库编号）',
   mseemployee          VARCHAR(50) COMMENT '制单人员',
   mesAuditingemp       VARCHAR(50) COMMENT '复核人员',
   Mesremark            VARCHAR(50) COMMENT '备注',
   messtate             VARCHAR(50) COMMENT '审核状态',
   Mestrash             VARCHAR(50) COMMENT '是否可用',
   Mespreservingone     VARCHAR(50) COMMENT '保留字段1',
   mespreservingtwo     VARCHAR(50) COMMENT '保留字段2',
   Mespreservingthree   VARCHAR(50) COMMENT '保留字段3',
   PRIMARY KEY (Mseno)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='人员表';

ALTER TABLE movestorage COMMENT '调拨单主表';

/*==============================================================*/
/* Table: othercome                                             */
/*==============================================================*/
CREATE TABLE othercome
(
   Othcomeid            VARCHAR(50) NOT NULL COMMENT '单据号码',
   Othcomedate          DATE COMMENT '单据日期',
   othcometypeid        VARCHAR(50) COMMENT '入库类型',
   Othcomestore         VARCHAR(50) COMMENT '仓库',
   Othcomename          VARCHAR(50) COMMENT '入库人员',
   Othcomedept          VARCHAR(50) COMMENT '所属部门',
   Othcomemakemanid     VARCHAR(50) COMMENT '制单人员',
   Othcomerepeatuserid  VARCHAR(50) COMMENT '复核人员',
   tone                 VARCHAR(50) COMMENT '保留字段',
   ttwo                 VARCHAR(50) COMMENT '保留字段',
   PRIMARY KEY (Othcomeid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='销售订单主表';

ALTER TABLE othercome COMMENT '其它入库主表';

/*==============================================================*/
/* Table: othercomedetail                                       */
/*==============================================================*/
CREATE TABLE othercomedetail
(
   Othcomeid            VARCHAR(50) COMMENT '单据号码',
   Othcomeno            VARCHAR(50) NOT NULL COMMENT '栏号',
   Othcomemertialsid    VARCHAR(50) COMMENT '物料编号',
   Othcomemertialname   VARCHAR(50) COMMENT '物料名称',
   Othcometypes         VARCHAR(50) COMMENT '规格型号',
   Othcomeunits         VARCHAR(50) COMMENT '单位',
   Othcomeamount        INT(11) COMMENT '数量',
   Othmoney             VARCHAR(50) COMMENT '单价',
   Jine                 INT(11) COMMENT '金额',
   Beizhu               VARCHAR(50) COMMENT '备注',
   Ziduanone            VARCHAR(50) COMMENT '保留字段',
   Ziduantwo            VARCHAR(50) COMMENT '保留字段',
   PRIMARY KEY (Othcomeno)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='销售订单主表';

ALTER TABLE othercomedetail COMMENT '其它入库明细表';

/*==============================================================*/
/* Table: otheroutdetail                                        */
/*==============================================================*/
CREATE TABLE otheroutdetail
(
   otheroutid           VARCHAR(50) COMMENT '单据号码',
   Othoutlineno         VARCHAR(50) NOT NULL COMMENT '栏号',
   Othoutmertialsid     VARCHAR(50) COMMENT '物料编号',
   Othoutmertialname    VARCHAR(50) COMMENT '物料名称',
   Othouttypes          VARCHAR(50) COMMENT '规格型号',
   Othoutunits          VARCHAR(50) COMMENT '单位',
   Othoutamount         INT(11) COMMENT '数量',
   othoutremark         VARCHAR(50) COMMENT '备注',
   Tone                 VARCHAR(50) COMMENT '保留字段',
   Ttwo                 VARCHAR(50) COMMENT '保留字段',
   Ttherr               VARCHAR(50) COMMENT '保留字段',
   PRIMARY KEY (Othoutlineno)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='销售订单主表';

ALTER TABLE otheroutdetail COMMENT '其它出库明细表';

/*==============================================================*/
/* Table: otheroutmain                                          */
/*==============================================================*/
CREATE TABLE otheroutmain
(
   Othid                VARCHAR(50) NOT NULL COMMENT '单据号码',
   Othdate              DATE COMMENT '单据日期',
   othouttypeid         VARCHAR(50) COMMENT '出库类型',
   othstore             VARCHAR(50) COMMENT '仓库',
   Othoutname           VARCHAR(50) COMMENT '出库人名',
   Othdept              VARCHAR(50) COMMENT '所属部门',
   Othmakemanid         VARCHAR(50) COMMENT '制单人员',
   Othrepeatuserid      VARCHAR(50) COMMENT '复核人员',
   Oonw                 VARCHAR(50) COMMENT '保留字段',
   otwo                 VARCHAR(50) COMMENT '保留字段',
   otherr                VARCHAR(50) COMMENT '保留字段',
   PRIMARY KEY (Othid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT '销售订单主表';

ALTER TABLE otheroutmain COMMENT '其它出库主表 ';

/*==============================================================*/
/* Table: payment                                               */
/*==============================================================*/
CREATE TABLE payment
(
   payid                VARCHAR(20) NOT NULL COMMENT '应付冲款单单号',
   paydate              DATE COMMENT '单据日期',
   purveyid             VARCHAR(20) COMMENT '供应商ID',
   purveyname           VARCHAR(50) COMMENT '供应商名称',
   paystrike1           VARCHAR(50) COMMENT '结算方式1',
   paystrike2           VARCHAR(50) COMMENT '结算方式2',
   paystrike3           VARCHAR(50) COMMENT '结算方式3',
   paymoney1            FLOAT COMMENT '金额1',
   paymoney2            FLOAT COMMENT '金额2',
   paymoney3            FLOAT COMMENT '金额3',
   paymakeing           VARCHAR(50) COMMENT '制单人员',
   paydept              VARCHAR(50) COMMENT '制单人所属部门',
   stodeptid            VARCHAR(50) COMMENT '部门ID （伪ID）',
   paycheckman          VARCHAR(50) COMMENT '审核人员',
   payremark            VARCHAR(2000) COMMENT '备注',
   isaditing            INT(9) COMMENT '是否审核',
   enables              INT COMMENT '标识是否删除',
   PRIMARY KEY (payid)
);

ALTER TABLE payment COMMENT '应付冲款单主表';

/*==============================================================*/
/* Table: paymentdetails                                        */
/*==============================================================*/
CREATE TABLE paymentdetails
(
   payid                VARCHAR(20) NOT NULL COMMENT '应付冲款单单号',
   paydetid             INT COMMENT '行号',
   advdetoddtype        VARCHAR(50) COMMENT '来源单别',
   originaldate         DATE COMMENT '原单日期',
   advdetoddid          VARCHAR(20) COMMENT '原单单号',
   invoicenumber        VARCHAR(50) COMMENT '发票号码',
   transactors          VARCHAR(100) COMMENT '交易对象',
   Transactorsname      VARCHAR(100) COMMENT '交易对象名称',
   stodeptid            VARCHAR(50) COMMENT '部门编号',
   departmentname       VARCHAR(50) COMMENT '部门名称',
   Purchaser            VARCHAR(50) COMMENT '采购人员',
   entryname            VARCHAR(50) COMMENT '项目名称',
   formeroddmoney       FLOAT COMMENT '原单金额',
   nocebalance          FLOAT COMMENT '现行余额',
   payzr                FLOAT COMMENT '折让金额',
   paydetmoney          FLOAT COMMENT '冲款金额',
   rushmoney            FLOAT COMMENT '冲抵金额',
   enables              INT COMMENT '标识是否删除',
   PRIMARY KEY (payid)
);

ALTER TABLE paymentdetails COMMENT '应付冲款单明细表';

/*==============================================================*/
/* Table: procurementinvoicebreakdown                           */
/*==============================================================*/
CREATE TABLE procurementinvoicebreakdown
(
   invoiceddetailsid    INT(9) NOT NULL COMMENT '发票明细表ID',
   lineint              INT COMMENT '行号',
   materialint          VARCHAR(50) COMMENT '物料编号',
   namematerial         VARCHAR(100) COMMENT '物料名称',
   specificationtype    VARCHAR(50) COMMENT '规格型号',
   nameofunit           VARCHAR(50) COMMENT '单位名称',
   num                  INT COMMENT '数量',
   unitprice            FLOAT COMMENT '单价',
   amountofmoney        FLOAT COMMENT '金额',
   taxrate              FLOAT COMMENT '税率%',
   taxamount            FLOAT COMMENT '税额',
   taxableamount        FLOAT COMMENT '含税金额',
   unenteredquantity    INT COMMENT '未进数量',
   purchasingorderint   VARCHAR(50) COMMENT '采购订单号',
   notestoentries       VARCHAR(50) COMMENT '分录备注',
   PRIMARY KEY (invoiceddetailsid)
);

ALTER TABLE procurementinvoicebreakdown COMMENT '采购发票明细表';

/*==============================================================*/
/* Table: provideinfo                                           */
/*==============================================================*/
CREATE TABLE provideinfo
(
   Peoid                INT(11) NOT NULL COMMENT '供应商编号',
   Peoname              VARCHAR(50) COMMENT '供应商全称',
   Peoshortname         VARCHAR(50) COMMENT '供应商简称',
   Peoascription        VARCHAR(50) COMMENT '帐款归属',
   Peopeeid             VARCHAR(50) COMMENT '供应商类型表id',
   Peopeename           VARCHAR(50) COMMENT '供应商类型表名称（新增）',
   Peoarea              VARCHAR(50) COMMENT '地区',
   Peoprincipal         VARCHAR(50) COMMENT '负责人',
   Peolinkman           VARCHAR(50) COMMENT '联系人',
   Peophoneone          VARCHAR(50) COMMENT '联系电话一',
   Peophonetwo          VARCHAR(50) COMMENT '联系电话二',
   Peomobilephone       VARCHAR(50) COMMENT '移动电话',
   Peobankaccounts      VARCHAR(50) COMMENT '银行帐号',
   Peoopenbank          VARCHAR(50) COMMENT '开户银行',
   Peoempid             VARCHAR(50) COMMENT '（业务人员编号）',
   Peoempname           VARCHAR(50) COMMENT '（业务人员名称）',
   Peocalling           VARCHAR(50) COMMENT '行业别',
   Peoemail             VARCHAR(50) COMMENT '电子邮件',
   Peoweb               VARCHAR(50) COMMENT '网址',
   Peofaxes             VARCHAR(50) COMMENT '传真号码',
   Peocreatedate        VARCHAR(50) COMMENT '建立日期',
   Peocreditclass       VARCHAR(50) COMMENT '信用等级',
   Peozhangkuanedu      DECIMAL(10,2) COMMENT '帐款额度',
   Peoremainedu         DECIMAL(10,2) COMMENT '剩余额度',
   Peomonthreckoning    DECIMAL(10,2) COMMENT '每月结帐日',
   Peoqcprepaymoney     DECIMAL(10,2) COMMENT '期初预付款',
   Peoqcdealmoney       DECIMAL(10,2) COMMENT '期初应付款',
   Peoqmprepaymoney     DECIMAL(10,2) COMMENT '期末预付款',
   Peoqmdealmoney       DECIMAL(10,2) COMMENT '期末应付款',
   Peoremark            VARCHAR(200) COMMENT '备注',
   Peotrash             INT(11) COMMENT '是否废码',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   Enables              INT(11) COMMENT '标识是否删除',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Peoid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='供应商主文件表';

/*==============================================================*/
/* Table: recededetails                                         */
/*==============================================================*/
CREATE TABLE recededetails
(
   Recid                VARCHAR(20) NOT NULL COMMENT '采购退货单号(stockrecede外键)',
   Matid                VARCHAR(50) COMMENT '物料编号(非外键)',
   Matname              VARCHAR(50) COMMENT '物料名称',
   Matspec              VARCHAR(20) COMMENT '规格型号',
   Detnum               INT(11) COMMENT '数量',
   Detagioprice         FLOAT COMMENT '折扣前单价',
   Detdiscount          INT(11) COMMENT '折数',
   Detprice             FLOAT COMMENT '单价',
   Detamtmoney          FLOAT COMMENT '金额',
   Depcess              INT(11) COMMENT '税率',
   Depcessmoney         FLOAT COMMENT '税额',
   Deplargess           INT(11) COMMENT '是否赠品',
   Sodorigintype        VARCHAR(20) COMMENT '来源单别',
   Sodorigin            VARCHAR(20) COMMENT '来源单号',
   Enables              INT(11) COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Recid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='采购退货明细表';

/*==============================================================*/
/* Table: saleaccountdetails                                    */
/*==============================================================*/
CREATE TABLE saleaccountdetails
(
   Minusaddid           INT(11) NOT NULL COMMENT '主键ID',
   Sinid                INT(11) NOT NULL COMMENT '来源单别',
   Sinname              VARCHAR(50) NOT NULL COMMENT '来源单别名称',
   Originbillid         VARCHAR(20) NOT NULL COMMENT '来源单号',
   Nowdate              DATE NOT NULL COMMENT '来源单据日期',
   Cliid                INT(11) NOT NULL COMMENT '客户编号client(cliid)',
   Showdate             DATE NOT NULL COMMENT '日期',
   Originoddmoney       FLOAT NOT NULL COMMENT '原单金额',
   Currentlybalance     FLOAT NOT NULL COMMENT '现行余额',
   Remark               VARCHAR(2000) NOT NULL COMMENT '备注',
   Enables              INT(11) NOT NULL COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Safetytwo            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Minusaddid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='账款明细表';

/*==============================================================*/
/* Table: sell_order                                            */
/*==============================================================*/
CREATE TABLE sell_order
(
   bill_id              VARCHAR(50) NOT NULL COMMENT '单据号码',
   bill_date            DATE DEFAULT NULL COMMENT '单据日期',
   bill_type            VARCHAR(50) DEFAULT NULL COMMENT '销售订单类型',
   chi_order            VARCHAR(50) DEFAULT NULL COMMENT '客户订单',
   chiplace             VARCHAR(50) DEFAULT NULL COMMENT '地址',
   order_status         INT(11) DEFAULT NULL COMMENT '单况（1.未结案。2.已结案 3.已无效）',
   currency             INT(11) DEFAULT NULL COMMENT '币别',
   price_whether_tax    TINYINT(1) DEFAULT NULL COMMENT '单价是否含税',
   emp_id               INT(11) DEFAULT NULL COMMENT '业务人员编号',
   emp_name             VARCHAR(50) DEFAULT NULL COMMENT '业务人员姓名',
   dep_id               INT(11) DEFAULT NULL COMMENT '部门编号',
   dep_name             VARCHAR(50) DEFAULT NULL COMMENT '部门名字',
   mark_emp_name        VARCHAR(50) DEFAULT NULL COMMENT '制单人员',
   auditing_emp_name    VARCHAR(50) DEFAULT NULL COMMENT '复核人员',
   check_state          INT(11) DEFAULT NULL COMMENT '0未审核  1已审核',
   remark               VARCHAR(255) DEFAULT NULL COMMENT '备注',
   collection_terms     INT(11) DEFAULT NULL COMMENT '收款条件(外键)',
   collection_day       INT(11) DEFAULT NULL COMMENT '收款天数',
   collection_date      DATE DEFAULT NULL COMMENT '收款日期',
   belong_project       INT(11) DEFAULT NULL COMMENT '所属项目(外键)',
   is_exist             INT(11) DEFAULT NULL COMMENT '是否已被删除',
   PRIMARY KEY (bill_id)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='销售订单表';

/*==============================================================*/
/* Table: sell_order_item                                       */
/*==============================================================*/
CREATE TABLE sell_order_item
(
   id                   INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增列',
   bill_id              VARCHAR(50) DEFAULT NULL COMMENT '主单据号',
   mat_id               INT(11) DEFAULT NULL COMMENT '物料编号',
   mat_name             VARCHAR(50) DEFAULT NULL COMMENT '物料名称',
   mat_spec             VARCHAR(50) DEFAULT NULL COMMENT '规格型号',
   mat_unit             VARCHAR(50) DEFAULT NULL COMMENT '单位名称',
   number               INT(11) DEFAULT NULL COMMENT '数量',
   agio_ago_price       FLOAT DEFAULT NULL COMMENT '折扣前单价',
   agio                 INT(11) DEFAULT NULL COMMENT '折数（默认100）',
   price                FLOAT DEFAULT NULL COMMENT '单价',
   money                FLOAT DEFAULT NULL COMMENT '金额',
   cess                 INT(11) DEFAULT NULL COMMENT '税率（默认17）',
   taxmoney             FLOAT DEFAULT NULL COMMENT '税额',
   intaxmoney           FLOAT DEFAULT NULL COMMENT '含税金额',
   present              TINYINT(1) DEFAULT NULL COMMENT '是否赠品',
   fact_cost            FLOAT DEFAULT NULL COMMENT '实际成本',
   criterion_cost       FLOAT DEFAULT NULL COMMENT '标准成本',
   out_tiem             DATE DEFAULT NULL COMMENT '预出库日',
   no_out_number        INT(11) DEFAULT NULL COMMENT '未出库数量',
   mat_group            TINYINT(1) DEFAULT NULL COMMENT '物料组合',
   sin_name             VARCHAR(50) DEFAULT NULL COMMENT '来源单别',
   origin_bill_id       VARCHAR(50) DEFAULT NULL COMMENT '来源单号',
   production           TINYINT(1) DEFAULT NULL COMMENT '生产',
   production_number    INT(11) DEFAULT NULL COMMENT '以生产数量',
   remark               VARCHAR(255) DEFAULT NULL COMMENT '备注',
   is_exit              TINYINT(1) DEFAULT NULL COMMENT '是否已被删除',
   PRIMARY KEY (id)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='销售订单详细表';

/*==============================================================*/
/* Table: sell_quote                                            */
/*==============================================================*/
CREATE TABLE sell_quote
(
   bill_id              VARCHAR(50) NOT NULL COMMENT '单价号码',
   bill_date            DATE DEFAULT NULL COMMENT '单击日期',
   CLIENT               VARCHAR(50) DEFAULT NULL COMMENT '客户编号',
   cli_short_name       VARCHAR(50) DEFAULT NULL COMMENT '客户简称',
   cli_place_id         INT(11) DEFAULT NULL COMMENT '地址编号',
   cli_place            VARCHAR(50) DEFAULT NULL COMMENT '客户地址',
   order_status         INT(11) DEFAULT NULL COMMENT '1.未结案。2.已结案 3.已无效',
   currency             INT(11) DEFAULT NULL COMMENT '币别',
   price_whether_tax    TINYINT(1) DEFAULT NULL COMMENT '单价是否含税',
   emp_id               INT(11) DEFAULT NULL COMMENT '业务人员编号',
   emp_name             VARCHAR(50) DEFAULT NULL COMMENT '业务人员姓名',
   dep_id               INT(11) DEFAULT NULL COMMENT '部门编号',
   dep_name             VARCHAR(50) DEFAULT NULL COMMENT '部门名称',
   make_emp_name        VARCHAR(50) DEFAULT NULL COMMENT '制单人员',
   auditing_emp_name    VARCHAR(50) DEFAULT NULL COMMENT '复核人员',
   check_state          INT(11) DEFAULT NULL COMMENT '0.未审核  1.已审核',
   remark               VARCHAR(200) DEFAULT NULL COMMENT '备注',
   total_money          FLOAT DEFAULT NULL COMMENT '合计金额',
   tatal_tax            FLOAT DEFAULT NULL COMMENT '合计税额',
   total_tax_money      FLOAT DEFAULT NULL COMMENT '合计含税金额',
   is_exist             TINYINT(1) DEFAULT NULL COMMENT '是否已删除',
   PRIMARY KEY (bill_id)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='销售报价主表';

/*==============================================================*/
/* Table: sell_quote_item                                       */
/*==============================================================*/
CREATE TABLE sell_quote_item
(
   id                   INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增列',
   bill_id              VARCHAR(50) DEFAULT NULL COMMENT '主单据号',
   mat_name             VARCHAR(50) DEFAULT NULL COMMENT '物料名称',
   mat_spec             VARCHAR(50) DEFAULT NULL COMMENT '规格型号',
   mat_unit             VARCHAR(50) DEFAULT NULL COMMENT '单位名称',
   number               INT(11) DEFAULT NULL COMMENT '数量',
   agio_ago_price       FLOAT DEFAULT NULL COMMENT '折扣前单价',
   agio                 INT(11) DEFAULT NULL COMMENT '默认100',
   price                FLOAT DEFAULT NULL COMMENT '单价',
   money                FLOAT DEFAULT NULL COMMENT '金额',
   cess                 INT(11) DEFAULT NULL COMMENT '税率（默认17）',
   taxmoney             FLOAT DEFAULT NULL COMMENT '税额',
   intaxmoney           FLOAT DEFAULT NULL COMMENT '含税金额',
   present              TINYINT(1) DEFAULT NULL COMMENT '是否赠品',
   fact_cost            FLOAT DEFAULT NULL COMMENT '实际成本',
   criterion_cost       FLOAT DEFAULT NULL COMMENT '标准成本',
   is_exit              TINYINT(1) DEFAULT NULL COMMENT '是否已被删除',
   remark               VARCHAR(50) DEFAULT NULL COMMENT '备注',
   PRIMARY KEY (id)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='销售报价单详细表	';

/*==============================================================*/
/* Table: sellinvoice                                           */
/*==============================================================*/
CREATE TABLE sellinvoice
(
   bill_id              VARCHAR(50) NOT NULL COMMENT '单据号码',
   bill_date            DATE DEFAULT NULL COMMENT '单据日期',
   bill_type            VARCHAR(50) DEFAULT NULL COMMENT '单据类型',
   chi_id               INT(50) DEFAULT NULL COMMENT '客户id',
   chi_name             VARCHAR(50) DEFAULT NULL COMMENT '客户姓名',
   sell_check_state     INT(11) DEFAULT NULL COMMENT '销售核对状态',
   check_state          INT(11) DEFAULT NULL COMMENT '0未审核  1已审核',
   currency             INT(11) DEFAULT NULL COMMENT '币别',
   price_whether_tax    TINYINT(1) DEFAULT NULL COMMENT '单价是否含税',
   emp_id               INT(11) DEFAULT NULL COMMENT '业务人员编号',
   emp_name             VARCHAR(50) DEFAULT NULL COMMENT '业务人员姓名',
   dep_id               INT(11) DEFAULT NULL COMMENT '部门编号',
   dep_name             VARCHAR(50) DEFAULT NULL COMMENT '部门名字',
   mark_emp_name        VARCHAR(50) DEFAULT NULL COMMENT '制单人员',
   auditing_emp_name    VARCHAR(50) DEFAULT NULL COMMENT '复核人员',
   remark               VARCHAR(255) DEFAULT NULL COMMENT '备注',
   collection_terms     INT(11) DEFAULT NULL COMMENT '收款条件(外键)',
   collection_day       INT(11) DEFAULT NULL COMMENT '收款天数',
   collection_date      DATE DEFAULT NULL COMMENT '收款日期',
   belong_project       INT(11) DEFAULT NULL COMMENT '所属项目(外键)',
   is_exist             INT(11) DEFAULT NULL COMMENT '是否已被删除',
   invoice_id           INT(11) DEFAULT NULL COMMENT '发票类型id',
   invoice_number       VARCHAR(50) DEFAULT NULL COMMENT '发票号码',
   settle_way_one       VARCHAR(50) DEFAULT NULL COMMENT '结算方式1',
   settle_money_one     FLOAT DEFAULT NULL COMMENT '结算方式1金额',
   settle_way_two       VARCHAR(50) DEFAULT NULL COMMENT '结算方式2',
   settle_money_two     FLOAT DEFAULT NULL COMMENT '结算方式2金额',
   PRIMARY KEY (bill_id)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='销售发票表';

/*==============================================================*/
/* Table: sellinvoiceitem                                       */
/*==============================================================*/
CREATE TABLE sellinvoiceitem
(
   id                   INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增列',
   bill_id              VARCHAR(50) DEFAULT NULL COMMENT '主单据号',
   mat_name             VARCHAR(50) DEFAULT NULL COMMENT '物料名称',
   mat_spec             VARCHAR(50) DEFAULT NULL COMMENT '规格型号',
   mat_unit             VARCHAR(50) DEFAULT NULL COMMENT '单位名称',
   number               INT(11) DEFAULT NULL COMMENT '数量',
   agio                 INT(11) DEFAULT NULL COMMENT '默认100',
   price                FLOAT DEFAULT NULL COMMENT '单价',
   money                FLOAT DEFAULT NULL COMMENT '金额',
   cess                 INT(11) DEFAULT NULL COMMENT '税率（默认17）',
   taxmoney             FLOAT DEFAULT NULL COMMENT '税额',
   intaxmoney           FLOAT DEFAULT NULL COMMENT '含税金额',
   no_out_number        INT(11) DEFAULT NULL COMMENT '未出库数量',
   sell_order           VARCHAR(50) DEFAULT NULL COMMENT '销售订单号',
   remark               VARCHAR(50) DEFAULT NULL COMMENT '分录备注',
   is_exit              INT(3) DEFAULT NULL COMMENT '是否已被删除',
   PRIMARY KEY (id)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='销售发票详细表';

/*==============================================================*/
/* Table: sellinvoicelist                                       */
/*==============================================================*/
CREATE TABLE sellinvoicelist
(
   id                   INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增列',
   bill_id              VARCHAR(50) DEFAULT NULL COMMENT '主发票单据号',
   mat_name             VARCHAR(50) DEFAULT NULL COMMENT '物料名称',
   mat_spec             VARCHAR(50) DEFAULT NULL COMMENT '规格型号',
   mat_unit             VARCHAR(50) DEFAULT NULL COMMENT '单位名称',
   number               INT(11) DEFAULT NULL COMMENT '数量',
   agio                 INT(11) DEFAULT NULL COMMENT '默认100',
   price                FLOAT DEFAULT NULL COMMENT '单价',
   money                FLOAT DEFAULT NULL COMMENT '金额',
   cess                 INT(11) DEFAULT NULL COMMENT '税率（默认17）',
   taxmoney             FLOAT DEFAULT NULL COMMENT '税额',
   intaxmoney           FLOAT DEFAULT NULL COMMENT '含税金额',
   no_out_number        INT(11) DEFAULT NULL COMMENT '未出库数量',
   sin_name             VARCHAR(50) DEFAULT NULL COMMENT '来源单别',
   origin_bill_id       VARCHAR(50) DEFAULT NULL COMMENT '来源单号',
   remark               VARCHAR(50) DEFAULT NULL COMMENT '分录备注',
   is_exit              INT(3) DEFAULT NULL COMMENT '是否已被删除',
   PRIMARY KEY (id)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='销售发票清单表';

/*==============================================================*/
/* Table: stockapply                                            */
/*==============================================================*/
CREATE TABLE stockapply
(
   Appid                VARCHAR(20) NOT NULL COMMENT '请购单编号',
   Appdate              DATE NOT NULL COMMENT '请购单日期',
   Apptype              VARCHAR(50) NOT NULL COMMENT '请购采购类型',
   Appcircs             INT(11) NOT NULL COMMENT '单况：已结案/未结案/无效',
   Appperson            VARCHAR(50) NOT NULL COMMENT '请购人员',
   Apppersonid          VARCHAR(50) NOT NULL COMMENT '伪外键：请购人员id',
   Appdept              VARCHAR(50) NOT NULL COMMENT '请购部门',
   Appdeptid            VARCHAR(50) NOT NULL COMMENT '伪外键：请购部门id',
   Appmaker             VARCHAR(50) NOT NULL COMMENT '制单人员',
   Appauditingperson    VARCHAR(50) NOT NULL COMMENT '复核人员',
   Appauditing          VARCHAR(50) NOT NULL COMMENT '审核状态：未审核/已审核/无效',
   Stockapplyname       VARCHAR(50) NOT NULL COMMENT '保存（“采购请购”）',
   Enables              INT(11) NOT NULL COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) NOT NULL COMMENT '保留字段 保存（“采购请购”）',
   Safetytwo            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Appid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='采购请购主表';

/*==============================================================*/
/* Table: stockapplydetails                                     */
/*==============================================================*/
CREATE TABLE stockapplydetails
(
   Appid                VARCHAR(20) NOT NULL COMMENT '请购单编号',
   Apdmateridlid        VARCHAR(50) COMMENT '物料编号(伪外：物料主文件)',
   Apdmateridlname      VARCHAR(50) COMMENT '物料名称',
   Apdmodel             VARCHAR(50) COMMENT '规格型号',
   Apdunit              VARCHAR(50) COMMENT '单位名称',
   Apdnum               INT(11) COMMENT '数量',
   Apdstandardprice     FLOAT COMMENT '标准进价',
   Apdstandardmoney     FLOAT COMMENT '标准进价金额',
   Apdprice             FLOAT COMMENT '单价',
   Apdintomoney         FLOAT COMMENT '进价金额',
   Apddemanddate        DATE COMMENT '需求日期',
   Apdstockdate         DATE COMMENT '建议采购日期',
   Apdnotnum            INT(11) COMMENT '未采购数量',
   Apdoriginid          VARCHAR(50) COMMENT '来源单别',
   Apdorigintype        VARCHAR(20) COMMENT '来源单号',
   Apdremark            VARCHAR(2000) COMMENT '备注',
   Enables              INT(11) COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Appid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='采购请购明细表';

/*==============================================================*/
/* Table: stockapplytype                                        */
/*==============================================================*/
CREATE TABLE stockapplytype
(
   Aptid                VARCHAR(20) NOT NULL COMMENT '类型编号',
   Aptname              VARCHAR(50) NOT NULL COMMENT '类型名称',
   Aptename             VARCHAR(50) NOT NULL COMMENT '英文名称',
   Aptremark            VARCHAR(2000) NOT NULL COMMENT '备注',
   ENABLE               INT(11) NOT NULL COMMENT '标识是否删除',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Aptid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='采购请购类型表';

/*==============================================================*/
/* Table: stockapportion                                        */
/*==============================================================*/
CREATE TABLE stockapportion
(
   Appid                VARCHAR(20) NOT NULL COMMENT '采购分摊单号',
   Appdate              DATE COMMENT '分摊日期',
   Wisname              VARCHAR(50) COMMENT '分摊方式',
   Appamtmoney          FLOAT COMMENT '待摊金额',
   Makeperson           VARCHAR(50) COMMENT '制单人员',
   Auditingperson       VARCHAR(50) COMMENT '复核人员',
   Estate               VARCHAR(50) COMMENT '是否已审核',
   Enables              INT(11) COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Appid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='采购分摊主表';

/*==============================================================*/
/* Table: stockinquire                                          */
/*==============================================================*/
CREATE TABLE stockinquire
(
   Stoid                VARCHAR(20) NOT NULL COMMENT '询价单编号',
   Stopname             VARCHAR(50) NOT NULL COMMENT '供应商',
   Stopid               VARCHAR(50) NOT NULL COMMENT '伪外键(供应商主文件)',
   Stopaddress          VARCHAR(100) NOT NULL COMMENT '供应商地址',
   Sotdate              DATE NOT NULL COMMENT '单据日期',
   Stoavdate            DATE NOT NULL COMMENT '有效日期',
   Stoistax             VARCHAR(50) NOT NULL COMMENT '是否含税(含税/未含税)',
   Stodaddress          VARCHAR(100) NOT NULL COMMENT '送货地址',
   Stomakeperson        VARCHAR(50) NOT NULL COMMENT '制单人员',
   Stoauditingperson    VARCHAR(50) NOT NULL COMMENT '复核人员',
   Stostockperson       VARCHAR(50) NOT NULL COMMENT '采购人员',
   Stopersonid          VARCHAR(50) NOT NULL COMMENT '伪外键(请购人员外键)',
   Stodept              VARCHAR(50) NOT NULL COMMENT '所属部门',
   Stodeptid            VARCHAR(50) NOT NULL COMMENT '伪外键(所属部门外键)',
   Stoauditing          VARCHAR(50) NOT NULL COMMENT '审核状态：未审核/已审核/无效',
   Stockinquirename     VARCHAR(50) NOT NULL COMMENT '保存（“采购询价单”）',
   Enables              INT(11) NOT NULL COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Safetytwo            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Stoid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='采购询价主表';

/*==============================================================*/
/* Table: stockinquiredetails                                   */
/*==============================================================*/
CREATE TABLE stockinquiredetails
(
   Stoid                VARCHAR(20) NOT NULL COMMENT '询价单编号',
   Sdarows              INT(11) NOT NULL COMMENT '行号',
   Sdamaterielid        VARCHAR(50) NOT NULL COMMENT '物料编号',
   Sdamateridlname      VARCHAR(50) NOT NULL COMMENT '物料名称',
   Sdamodel             VARCHAR(50) NOT NULL COMMENT '规格型号',
   Sdaunit              VARCHAR(50) NOT NULL COMMENT '单位名称',
   Sdanum               INT(11) NOT NULL COMMENT '数量',
   Sdaagioes            FLOAT NOT NULL COMMENT '折前单价',
   Sdaagiocess          INT(11) NOT NULL COMMENT '折数(%)',
   Sdaprice             FLOAT NOT NULL COMMENT '单价',
   Sdamoney             FLOAT NOT NULL COMMENT '金额',
   Sdacess              INT(11) NOT NULL COMMENT '税率(%)',
   Sdataxmoney          FLOAT NOT NULL COMMENT '税额',
   Sdataxmoneys         FLOAT NOT NULL COMMENT '含税金额',
   Sdaislargess         INT(11) NOT NULL COMMENT '赠品：是/否',
   Sdaoriginid          VARCHAR(20) NOT NULL COMMENT '来源单号',
   Sdaorigintype        VARCHAR(50) NOT NULL COMMENT '来源单别',
   Sdaremark            VARCHAR(2000) NOT NULL COMMENT '备注',
   Enables              INT(11) NOT NULL COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Safetytwo            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Stoid, Sdarows)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='采购询价明细表';

/*==============================================================*/
/* Table: stockorder                                            */
/*==============================================================*/
CREATE TABLE stockorder
(
   Stoid                VARCHAR(20) NOT NULL COMMENT '单据号',
   Stodate              DATE NOT NULL COMMENT '日期',
   Stopeoname           VARCHAR(50) NOT NULL COMMENT '供货商',
   Stopeoid             VARCHAR(50) NOT NULL COMMENT '供货商编号',
   Stopeoadress         VARCHAR(50) NOT NULL COMMENT '供货商地址',
   Stoistax             VARCHAR(20) NOT NULL COMMENT '单价是否含税：1-含税，2-未税',
   Stostate             INT(11) NOT NULL COMMENT '单况：1-未结案，2-已结案，3-无效',
   Stoadress            VARCHAR(50) NOT NULL COMMENT '送货地址',
   Stoempstock          VARCHAR(50) NOT NULL COMMENT '采购人员',
   Stopersonid          VARCHAR(50) NOT NULL COMMENT '伪外键:采购人员id',
   Stodept              VARCHAR(50) NOT NULL COMMENT '采购部门',
   Stodeptid            VARCHAR(50) NOT NULL COMMENT '伪外键:部门id',
   Stoempname           VARCHAR(50) NOT NULL COMMENT '制单人员',
   Stoempcheck          VARCHAR(50) NOT NULL COMMENT '复核人员',
   Stomark              VARCHAR(2000) NOT NULL COMMENT '备注',
   Checkstate           INT(11) NOT NULL COMMENT '审核状态',
   Stockordername       VARCHAR(50) NOT NULL COMMENT '保存（采购订单）',
   Enables              INT(11) NOT NULL COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Safetytwo            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4'
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='采购订单主表';

/*==============================================================*/
/* Table: stockorderdetails                                     */
/*==============================================================*/
CREATE TABLE stockorderdetails
(
   Sodid                VARCHAR(20) NOT NULL COMMENT '单据号',
   Sodlineid            INT(11) NOT NULL COMMENT '栏号',
   Sodmaterielid        VARCHAR(50) NOT NULL COMMENT '物料编号',
   Sodmatid             VARCHAR(20) NOT NULL COMMENT '(物料名称)',
   Sodspec              VARCHAR(50) NOT NULL COMMENT '(规格型号)',
   Sodamount            INT(11) NOT NULL COMMENT '数量',
   Sodpreprice          FLOAT NOT NULL COMMENT '折扣前单价',
   Sodagio              INT(11) NOT NULL COMMENT '折数（%）',
   Sodprice             FLOAT NOT NULL COMMENT '单价',
   Sodsum               FLOAT NOT NULL COMMENT '金额',
   Sodcess              INT(11) NOT NULL COMMENT '税率（%）',
   Sodsumcess           FLOAT NOT NULL COMMENT '(税额)',
   Sodsumprice          FLOAT NOT NULL COMMENT '(含税金额）',
   Sodpreincomestorage  DATE NOT NULL COMMENT '预入库日',
   Sodpresent           VARCHAR(4) NOT NULL COMMENT '是否赠品',
   Sodorigintype        VARCHAR(20) NOT NULL COMMENT '(来源单别)',
   Sodorigin            VARCHAR(20) NOT NULL COMMENT '(来源单号)',
   Enables              INT(11) NOT NULL COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Safetytwo            VARCHAR(50) NOT NULL COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4'
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='采购订单明细表';

/*==============================================================*/
/* Table: stockrecede                                           */
/*==============================================================*/
CREATE TABLE stockrecede
(
   Recid                VARCHAR(20) NOT NULL COMMENT '采购退货单号',
   Recdate              DATE COMMENT '单据日期',
   Peoid                VARCHAR(50) COMMENT '供应商编号',
   Purveyname           VARCHAR(50) COMMENT '供货商名称',
   Peoaddress           VARCHAR(50) COMMENT '供应商地址',
   Stoid                VARCHAR(20) COMMENT '仓库编号',
   Depotname            VARCHAR(20) COMMENT '仓库名称',
   Containtax           INT(11) COMMENT '单价是否含税',
   Anewstorage          INT(11) COMMENT '是否重新入库',
   Stoperson            VARCHAR(50) COMMENT '采购人员姓名',
   Stopersonid          VARCHAR(50) COMMENT '采购人员ID',
   Stodept              VARCHAR(50) COMMENT '请购部门',
   Stodeptid            VARCHAR(50) COMMENT '部门编号',
   Makeperson           VARCHAR(50) COMMENT '制单人员',
   Auditingperson       VARCHAR(50) COMMENT '复核人员',
   Recremark            VARCHAR(2000) COMMENT '备注',
   Estate               VARCHAR(50) COMMENT '单据状态( 是否已经审核)',
   Stockrecedename      VARCHAR(50) COMMENT '保存（“采购退货单”）',
   Enables              INT(11) COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩?棺侄?',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Recid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='采购退货主表';

/*==============================================================*/
/* Table: stockstoragedetails                                   */
/*==============================================================*/
CREATE TABLE stockstoragedetails
(
   Storagedetailno      VARCHAR(20) NOT NULL COMMENT '引用采购入库单单号',
   Materielid           VARCHAR(50) COMMENT '引用物料文件ID',
   Materielname         VARCHAR(50) COMMENT '物料名称',
   TYPES                VARCHAR(20) DEFAULT NULL COMMENT '规格型号',
   Units                VARCHAR(20) COMMENT '单位',
   Amount               INT(11) COMMENT '数量',
   Rebateprice          FLOAT COMMENT '折扣前单价',
   Rebate               FLOAT COMMENT '折扣',
   Unitprice            FLOAT COMMENT '单价',
   Moneys               FLOAT COMMENT '金额',
   Cess                 FLOAT COMMENT '税率',
   Tax                  FLOAT COMMENT '税额',
   Taxmoneys            FLOAT COMMENT '含税金额',
   Origintype           VARCHAR(20) DEFAULT NULL COMMENT '来源单别',
   Originno             VARCHAR(20) DEFAULT NULL COMMENT '来源单号',
   Present              VARCHAR(20) COMMENT '是否赠品',
   Apportionmoney       FLOAT COMMENT '分摊费用',
   Enables              INT(11) COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Storagedetailno)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='采购入库明细';

/*==============================================================*/
/* Table: stockstoragetable                                     */
/*==============================================================*/
CREATE TABLE stockstoragetable
(
   Stockstorageno       VARCHAR(20) NOT NULL COMMENT '单号（自动生成）',
   Storagedate          DATE COMMENT '单据日期',
   Purveyid             VARCHAR(50) COMMENT '供货商ID',
   Purveyname           VARCHAR(50) COMMENT '供货商名称',
   Purveyaddress        VARCHAR(50) DEFAULT NULL COMMENT '供货商地址',
   Depotid              VARCHAR(50) COMMENT '仓库ID',
   Depotname            VARCHAR(50) COMMENT '仓库名称',
   Pricerevenue         VARCHAR(20) COMMENT '单价是否含税',
   Stoperson            VARCHAR(50) COMMENT '采购人员',
   Stodept              VARCHAR(50) COMMENT '采购人员所属部门名称',
   Stodeptid            VARCHAR(50) COMMENT '部门ID',
   Audituserid          VARCHAR(50) DEFAULT NULL COMMENT '审核人员ID',
   Repeatuserid         VARCHAR(50) DEFAULT NULL COMMENT '复核人员ID',
   Remark               VARCHAR(2000) DEFAULT NULL COMMENT '备注',
   Estate               INT(11) COMMENT '单据状态（是否以审核）',
   Stockstoragetablename VARCHAR(50) DEFAULT NULL COMMENT '保存（“采购入库单”）',
   Enables              INT(11) COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Stockstorageno)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='采购入库主表';

/*==============================================================*/
/* Table: storage                                               */
/*==============================================================*/
CREATE TABLE STORAGE
(
   Stoid                VARCHAR(50) NOT NULL COMMENT '仓库编号',
   Stoname              VARCHAR(50) COMMENT '仓库名称',
   Stosimplename        VARCHAR(50) COMMENT '仓库简称',
   Stoconnectper        VARCHAR(50) COMMENT '联系人',
   Stoempid             VARCHAR(50) COMMENT '联系人ID(新增)',
   Stophone             VARCHAR(50) COMMENT '联系电话',
   Stoaddress           VARCHAR(50) COMMENT '仓库地址',
   Storemark            VARCHAR(2000) COMMENT '备注',
   Safetyone            VARCHAR(50) COMMENT '保留字段',
   Safetytwo            VARCHAR(50) COMMENT '保留字段',
   Enables              INT(11) COMMENT '标识是否删除',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Stoid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='仓库表';

/*==============================================================*/
/* Table: supplieraddress                                       */
/*==============================================================*/
CREATE TABLE supplieraddress
(
   suaddrId             VARCHAR(50) COMMENT '供应商地址id',
   suaddress            VARCHAR(50) COMMENT '供应商地址',
   suzipcode            VARCHAR(50) COMMENT '邮政编码',
   sulinkman            VARCHAR(50) COMMENT '联系人',
   sulinkmanprof        VARCHAR(50) COMMENT '联系人职称',
   sutelephone          VARCHAR(50) COMMENT '联系人电话',
   sufaxno              VARCHAR(50) COMMENT '传真号码',
   suwalkaddr           VARCHAR(50) COMMENT '行走路线',
   sumemo               VARCHAR(50) COMMENT '备注',
   peoid                INT(11) COMMENT '供应商id'
);

ALTER TABLE supplieraddress COMMENT '供应商地址';

/*==============================================================*/
/* Table: takeadvancedetails                                    */
/*==============================================================*/
CREATE TABLE takeadvancedetails
(
   payid                VARCHAR(20) NOT NULL COMMENT '应付冲款单单号',
   takid                INT COMMENT '行号',
   advdetoddtype        VARCHAR(50) COMMENT '来源预付单单别',
   advdetoddid          VARCHAR(50) COMMENT '来源预付单号',
   advancebalance       FLOAT COMMENT '预付余额',
   adoptadvancemoney    FLOAT COMMENT '取用预付金额',
   stodeptid            VARCHAR(50) COMMENT '部门编号',
   departmentname       VARCHAR(50) COMMENT '部门名称',
   summaryofsources     VARCHAR(100) COMMENT '来源摘要',
   enables              INT COMMENT '标识是否删除',
   PRIMARY KEY (payid)
);

ALTER TABLE takeadvancedetails COMMENT '取用预付明细表';

/*==============================================================*/
/* Table: takeadvancegatherdetails                              */
/*==============================================================*/
CREATE TABLE takeadvancegatherdetails
(
   Payid                VARCHAR(20) NOT NULL COMMENT '应付冲款单单号',
   Takid                VARCHAR(20) NOT NULL COMMENT '行号',
   Advid                VARCHAR(20) NOT NULL COMMENT '预收单单号',
   Advdetid             VARCHAR(20) NOT NULL COMMENT '预收单行号',
   Takadvmoney          FLOAT NOT NULL COMMENT '取用预收金额',
   Enables              INT(11) NOT NULL COMMENT '标识是否删除',
   Safetyone            VARCHAR(50) NOT NULL COMMENT '保留字段1',
   Safetytwo            VARCHAR(50) NOT NULL COMMENT '保留字段2',
   Extend0              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段0',
   Extend1              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段1',
   Extend2              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段2',
   Extend3              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段3',
   Extend4              VARCHAR(200) DEFAULT NULL COMMENT '扩展字段4',
   PRIMARY KEY (Payid, Takid)
)
ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='取用预付明细表';

