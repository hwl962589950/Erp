/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.56 : Database - erp
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`erp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `erp`;

/*Table structure for table `accountmoneydetail` */

DROP TABLE IF EXISTS `accountmoneydetail`;

CREATE TABLE `accountmoneydetail` (
  `storageid` int(9) NOT NULL COMMENT '主键ID',
  `storagedate` date DEFAULT NULL COMMENT '单据日期',
  `origintypes` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `originid` varchar(20) DEFAULT NULL COMMENT '来源单号',
  `nowdate` date DEFAULT NULL COMMENT '日期',
  `clientsupply` varchar(50) DEFAULT NULL COMMENT '供货商名称',
  `citationid` varchar(50) DEFAULT NULL COMMENT '供货商ID',
  `formerlymoneys` float DEFAULT NULL COMMENT '原单金额',
  `nowadaysmoneys` float DEFAULT NULL COMMENT '现行余额',
  `enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  PRIMARY KEY (`storageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购账款明细表';

/*Data for the table `accountmoneydetail` */

/*Table structure for table `advance` */

DROP TABLE IF EXISTS `advance`;

CREATE TABLE `advance` (
  `advid` varchar(20) NOT NULL COMMENT '预付单单号',
  `advdate` date DEFAULT NULL COMMENT '单据日期',
  `purveyid` varchar(20) DEFAULT NULL COMMENT '供应商ID',
  `purveyname` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `advstrike1` varchar(50) DEFAULT NULL COMMENT '结算方式1',
  `advstrike2` varchar(50) DEFAULT NULL COMMENT '结算方式2',
  `advstrike3` varchar(50) DEFAULT NULL COMMENT '结算方式3',
  `advmoney1` float DEFAULT NULL COMMENT '金额1',
  `advmoney2` float DEFAULT NULL COMMENT '金额2',
  `advmoney3` float DEFAULT NULL COMMENT '金额3',
  `advmakeing` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `stodept` varchar(50) DEFAULT NULL COMMENT '制单人所属部门',
  `stodeptid` varchar(50) DEFAULT NULL COMMENT '部门ID',
  `advcheckman` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `advremark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `isaditing` int(9) DEFAULT NULL COMMENT '是否审核',
  `safetyone` varchar(50) DEFAULT NULL COMMENT '保存（“预付款单”）',
  `enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  PRIMARY KEY (`advid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预付款主表\n';

/*Data for the table `advance` */

/*Table structure for table `advancedetails` */

DROP TABLE IF EXISTS `advancedetails`;

CREATE TABLE `advancedetails` (
  `advid` varchar(20) NOT NULL COMMENT '主表单号',
  `advdetid` int(9) DEFAULT NULL COMMENT '行号',
  `advdetmoney` float DEFAULT NULL COMMENT '预付金额',
  `advdetoddtype` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `advdetoddid` varchar(20) DEFAULT NULL COMMENT '来源单号',
  `advdetdegest` varchar(50) DEFAULT NULL COMMENT '摘要',
  `advdetbalance` float DEFAULT NULL COMMENT '预付余额',
  `enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  PRIMARY KEY (`advid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预付款明细表';

/*Data for the table `advancedetails` */

/*Table structure for table `advancegather` */

DROP TABLE IF EXISTS `advancegather`;

CREATE TABLE `advancegather` (
  `Billid` varchar(20) NOT NULL COMMENT '单据号码',
  `Billdate` date NOT NULL COMMENT '单据日期',
  `Sinid` int(11) NOT NULL COMMENT '单据类型singleType(sinId)',
  `Cliid` varchar(50) NOT NULL COMMENT '客户编号client(cliid)',
  `Clishortname` varchar(50) NOT NULL COMMENT '客户简称',
  `Currencytype` varchar(50) NOT NULL COMMENT '币别',
  `Reckontypef` varchar(50) NOT NULL COMMENT '结算方式一',
  `Reckontypes` varchar(50) NOT NULL COMMENT '结算方式一',
  `Reckontypet` varchar(50) NOT NULL COMMENT '结算方式一',
  `Reckonmoneyf` float NOT NULL COMMENT '金额',
  `Reckonmoneys` float NOT NULL COMMENT '金额',
  `Reckonmoneyt` float NOT NULL COMMENT '金额',
  `Gatherdiscount` float NOT NULL COMMENT '折扣率',
  `Gatherendaccountmonth` date NOT NULL COMMENT '终止帐月',
  `Empid` varchar(50) NOT NULL COMMENT '业务人员编号，也就是人员编号employee(empid)',
  `Empname` varchar(50) NOT NULL COMMENT '业务人员',
  `Depid` varchar(50) NOT NULL COMMENT '部门编号depttab(depid)',
  `Depname` varchar(50) NOT NULL COMMENT '所属部门',
  `Makeempname` varchar(50) NOT NULL COMMENT '制单人员',
  `Auditingempname` varchar(50) NOT NULL COMMENT '复核人员',
  `Checkstate` int(11) NOT NULL COMMENT '审核状态',
  `Remark` varchar(2000) NOT NULL COMMENT '备注',
  `Enables` int(11) NOT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) NOT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) NOT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Billid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预收款主表';

/*Data for the table `advancegather` */

/*Table structure for table `advancegatherdetails` */

DROP TABLE IF EXISTS `advancegatherdetails`;

CREATE TABLE `advancegatherdetails` (
  `Cotemark` varchar(20) NOT NULL COMMENT '详表ID',
  `Billid` varchar(20) NOT NULL COMMENT '单据号码Advancegather(billId)',
  `Promisedmoney` float NOT NULL COMMENT '预收金额',
  `Advancemoney` float NOT NULL COMMENT '预收余额',
  `Sinname` varchar(50) NOT NULL COMMENT '来源单别',
  `Originbillid` varchar(20) NOT NULL COMMENT '来源单号',
  `Summary` varchar(2000) NOT NULL COMMENT '摘要',
  `Enables` int(11) NOT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) NOT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) NOT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Cotemark`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预收款明细表';

/*Data for the table `advancegatherdetails` */

/*Table structure for table `apportiondetails` */

DROP TABLE IF EXISTS `apportiondetails`;

CREATE TABLE `apportiondetails` (
  `Adesequ` varchar(20) NOT NULL COMMENT '详表ID',
  `Adeid` varchar(20) NOT NULL COMMENT '采购分摊外键',
  `Adeexesid` varchar(50) DEFAULT NULL COMMENT '费用编号',
  `Adeexesname` varchar(50) DEFAULT NULL COMMENT '费用名称',
  `Adeamtmoney` float DEFAULT NULL COMMENT '金额',
  `Enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Adesequ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购分摊费用明细表';

/*Data for the table `apportiondetails` */

/*Table structure for table `apportionresult` */

DROP TABLE IF EXISTS `apportionresult`;

CREATE TABLE `apportionresult` (
  `Atiid` varchar(20) NOT NULL COMMENT '采购分摊单号(采购分摊外键)',
  `Storageid` varchar(50) DEFAULT NULL COMMENT '采购入库单',
  `Matid` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `Matname` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `Matspec` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `Stockprice` float DEFAULT NULL COMMENT '采购金额',
  `Atinum` int(11) DEFAULT NULL COMMENT '数量',
  `Ademoney` float DEFAULT NULL COMMENT '分摊金额',
  `Enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Atiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购分摊结果';

/*Data for the table `apportionresult` */

/*Table structure for table `apportionwise` */

DROP TABLE IF EXISTS `apportionwise`;

CREATE TABLE `apportionwise` (
  `Wisid` varchar(20) NOT NULL COMMENT '分摊方式编号',
  `Wisname` varchar(50) DEFAULT NULL COMMENT '分摊方式名称',
  `Wisename` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `Wisremark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `Enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Wisid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分摊方式表';

/*Data for the table `apportionwise` */

/*Table structure for table `calculateunit` */

DROP TABLE IF EXISTS `calculateunit`;

CREATE TABLE `calculateunit` (
  `UnitId` varchar(50) NOT NULL COMMENT '单位编号',
  `UnitName` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `EngName` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `Memo` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`UnitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计量单位';

/*Data for the table `calculateunit` */

/*Table structure for table `checkdetail` */

DROP TABLE IF EXISTS `checkdetail`;

CREATE TABLE `checkdetail` (
  `Dcheid` varchar(20) DEFAULT NULL COMMENT '单据号码',
  `Dchelineid` int(11) NOT NULL COMMENT '栏号',
  `Dchematerielid` varchar(50) DEFAULT NULL COMMENT '物料的编号',
  `DcheunitnameDchematerielname` varchar(50) DEFAULT NULL COMMENT '物料的名称',
  `Dcheunitname` varchar(50) DEFAULT NULL COMMENT '单位',
  `Dcheaccountqty` int(20) DEFAULT NULL COMMENT '账面数量',
  `Dchecheckqty` int(20) DEFAULT NULL COMMENT '盘点数量',
  `Dcheprofitandlossqty` int(20) DEFAULT NULL COMMENT '盈亏数量',
  `Dcheprofitandlossmoney` int(20) DEFAULT NULL COMMENT '盈亏金额',
  `Dcheprice` int(20) DEFAULT NULL COMMENT '单价',
  `Dcheremark` varchar(50) DEFAULT NULL COMMENT '备注',
  `Done` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Dtwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `DMovespectype` varchar(50) DEFAULT NULL COMMENT '规格型号',
  PRIMARY KEY (`Dchelineid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='盘点明细表';

/*Data for the table `checkdetail` */

/*Table structure for table `checked` */

DROP TABLE IF EXISTS `checked`;

CREATE TABLE `checked` (
  `cheid` varchar(20) NOT NULL COMMENT '单据号码',
  `chestorageno` varchar(20) DEFAULT NULL COMMENT '盘点的仓库编号',
  `chejian` varchar(20) DEFAULT NULL COMMENT '盘点人名称',
  `chestoragename` varchar(20) DEFAULT NULL COMMENT '盘点的仓库名称',
  `chedate` date DEFAULT NULL COMMENT '盘点的日期',
  `cheman` varchar(20) DEFAULT NULL COMMENT '盘点人名称',
  `chedeptname` varchar(20) DEFAULT NULL COMMENT '部门名称',
  `cherestrictman` varchar(20) DEFAULT NULL COMMENT '制单人-当前登录人',
  `cheauditingman` varchar(20) DEFAULT NULL COMMENT '审核人-当前登录人',
  `chestatu` int(11) DEFAULT NULL COMMENT '审核状态，0为未审核',
  `chesone` varchar(20) DEFAULT NULL COMMENT '保留字段',
  `chestwo` varchar(20) DEFAULT NULL COMMENT '保留字段',
  `chejust` varchar(20) DEFAULT NULL COMMENT '增值科目',
  `cjian` char(10) DEFAULT NULL COMMENT '减值科目',
  PRIMARY KEY (`cheid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='盘点主表';

/*Data for the table `checked` */

/*Table structure for table `clashfund` */

DROP TABLE IF EXISTS `clashfund`;

CREATE TABLE `clashfund` (
  `Billid` varchar(20) NOT NULL COMMENT '单据号码',
  `Billdate` date NOT NULL COMMENT '单据日期',
  `Sinid` int(11) NOT NULL COMMENT '单据类型singleType(sinId)',
  `Cliid` varchar(50) NOT NULL COMMENT '客户编号client(cliid)',
  `Clishortname` varchar(50) NOT NULL COMMENT '客户简称',
  `Currencytype` varchar(50) NOT NULL COMMENT '币别',
  `Reckontypef` varchar(50) NOT NULL COMMENT '结算方式一',
  `Reckontypes` varchar(50) NOT NULL COMMENT '结算方式一',
  `Reckontypet` varchar(50) NOT NULL COMMENT '结算方式一',
  `Reckonmoneyf` float NOT NULL COMMENT '金额',
  `Reckonmoneys` float NOT NULL COMMENT '金额',
  `Reckonmoneyt` float NOT NULL COMMENT '金额',
  `Gatherdiscount` float NOT NULL COMMENT '折扣率',
  `Gatherendaccountmonth` date NOT NULL COMMENT '终止帐月',
  `Empid` varchar(50) NOT NULL COMMENT '业务人员编号，也就是人员编号employee(empid)',
  `Empname` varchar(50) NOT NULL COMMENT '业务人员',
  `Depid` varchar(50) NOT NULL COMMENT '部门编号depttab(depid)',
  `Depname` varchar(50) NOT NULL COMMENT '所属部门',
  `Makeempname` varchar(50) NOT NULL COMMENT '制单人员',
  `Auditingempname` varchar(50) NOT NULL COMMENT '复核人员',
  `Checkstate` int(11) NOT NULL COMMENT '审核状态',
  `Remark` varchar(2000) NOT NULL COMMENT '备注',
  `Enables` int(11) NOT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) NOT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) NOT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Billid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收款冲款主表';

/*Data for the table `clashfund` */

/*Table structure for table `clashfunddetailsone` */

DROP TABLE IF EXISTS `clashfunddetailsone`;

CREATE TABLE `clashfunddetailsone` (
  `Billid` varchar(20) NOT NULL COMMENT '单据号码clashfund(billId)',
  `Cotemark` int(11) NOT NULL COMMENT '栏号',
  `Sinname` varchar(50) NOT NULL COMMENT '来源单别(销售订单)',
  `Originbillid` varchar(20) NOT NULL COMMENT '来源单号',
  `Originodddate` date NOT NULL COMMENT '原单日期',
  `Originoddmoney` float NOT NULL COMMENT '原单金额',
  `Currentlybalance` float NOT NULL COMMENT '现行余额',
  `Discountmoney` float NOT NULL COMMENT '折让金额',
  `Clashmoney` float NOT NULL COMMENT '冲款金额',
  `Enables` int(11) NOT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) NOT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) NOT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Billid`,`Cotemark`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='冲款款明细表';

/*Data for the table `clashfunddetailsone` */

/*Table structure for table `client` */

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `cliId` varchar(50) NOT NULL COMMENT '客户编号',
  `clitypeid` varchar(50) DEFAULT NULL COMMENT '客户类别Id',
  `cliName` varchar(50) DEFAULT NULL COMMENT '客户全称',
  `clishortName` varchar(50) DEFAULT NULL COMMENT '客户简称',
  `cliaddress` varchar(50) DEFAULT NULL COMMENT '地方（具体）',
  `cliarea` varchar(50) DEFAULT NULL COMMENT '地区',
  `cliename` varchar(50) DEFAULT NULL COMMENT '英文全称',
  `clieshortname` varchar(50) DEFAULT NULL COMMENT '英文简称',
  `cliprincipal` varchar(50) DEFAULT NULL COMMENT '负责人',
  `clilinkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `cliphoneone` varchar(50) DEFAULT NULL COMMENT '联系电话一',
  `cliphonetow` varchar(50) DEFAULT NULL COMMENT '联系电话二',
  `empid` varchar(50) DEFAULT NULL COMMENT '业务人员id',
  `climobilephone` varchar(50) DEFAULT NULL COMMENT '移动电话',
  `cliemail` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `cliweb` varchar(50) DEFAULT NULL COMMENT '网址',
  `clifaxes` varchar(50) DEFAULT NULL COMMENT '传真号码',
  `clibankaccounts` varchar(50) DEFAULT NULL COMMENT '银行帐号',
  `cliopenbank` varchar(50) DEFAULT NULL COMMENT '开户银行',
  PRIMARY KEY (`cliId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户主文件';

/*Data for the table `client` */

/*Table structure for table `clientaddress` */

DROP TABLE IF EXISTS `clientaddress`;

CREATE TABLE `clientaddress` (
  `cliaddrId` varchar(50) NOT NULL COMMENT '客户地址编号',
  `cliaddress` varchar(50) DEFAULT NULL COMMENT '客户地址',
  `clizipcode` varchar(50) DEFAULT NULL COMMENT '邮政编码',
  `clilinkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `clilinkmanprof` varchar(50) DEFAULT NULL COMMENT '联系人职称',
  `clitelephone` varchar(50) DEFAULT NULL COMMENT '联系人电话',
  `clifaxno` varchar(50) DEFAULT NULL COMMENT '传真号码',
  `cliwalkaddr` varchar(50) DEFAULT NULL COMMENT '行走路线',
  `climemo` varchar(50) DEFAULT NULL COMMENT '备注',
  `cliid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cliaddrId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户地址';

/*Data for the table `clientaddress` */

/*Table structure for table `clienttype` */

DROP TABLE IF EXISTS `clienttype`;

CREATE TABLE `clienttype` (
  `Clitypeid` varchar(50) NOT NULL COMMENT '类别编号',
  `Clitypename` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `Clitypeename` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `Cliremark` varchar(50) DEFAULT NULL COMMENT '备注',
  `Clitypetrash` int(11) DEFAULT NULL COMMENT '是否废码',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `ENABLE` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Clitypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户类别表';

/*Data for the table `clienttype` */

/*Table structure for table `currencytype` */

DROP TABLE IF EXISTS `currencytype`;

CREATE TABLE `currencytype` (
  `CurrencyId` varchar(50) NOT NULL COMMENT '币别编号',
  `CurrencyName` varchar(50) DEFAULT NULL COMMENT '币别名称',
  `ShorName` varchar(50) DEFAULT NULL COMMENT '币别简称',
  `EngName` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `ModifyDate` varchar(50) DEFAULT NULL COMMENT '异动日期',
  `FixedRate` float DEFAULT NULL COMMENT '固定汇率',
  `BuyInRate` float DEFAULT NULL COMMENT '买进汇率',
  `SellOutRate` float DEFAULT NULL COMMENT '卖出汇率',
  `PricedDeciDigits` float DEFAULT NULL COMMENT '单价位数',
  `PriceThouPt` float DEFAULT NULL COMMENT '千位逗号',
  `AmountDeciDi` float DEFAULT NULL COMMENT '金额位数',
  `AmountThoupt` float DEFAULT NULL COMMENT '千位逗号',
  PRIMARY KEY (`CurrencyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='币别';

/*Data for the table `currencytype` */

/*Table structure for table `depothead` */

DROP TABLE IF EXISTS `depothead`;

CREATE TABLE `depothead` (
  `id` int(11) NOT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `subType` varchar(50) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `defaultNumber` varchar(50) DEFAULT NULL,
  `operPersonName` varchar(50) DEFAULT NULL,
  `operTime` datetime DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `tax` varchar(1) DEFAULT NULL,
  `exchangeRate` float DEFAULT NULL,
  `warehouse` varchar(255) DEFAULT NULL,
  `reRelease` varchar(1) DEFAULT NULL,
  `foreignTrade` varchar(1) DEFAULT NULL,
  `voucheId` varchar(50) DEFAULT NULL,
  `invoice` varchar(1) DEFAULT NULL,
  `attributionAccounts` varchar(20) DEFAULT NULL,
  `collectionDate` date DEFAULT NULL,
  `paymentConditions` varchar(20) DEFAULT NULL,
  `accountDay` varchar(50) DEFAULT NULL,
  `accountMonth` date DEFAULT NULL,
  `customColumn1` varchar(50) DEFAULT NULL,
  `CustomColumn2` varchar(50) DEFAULT NULL,
  `remark` text,
  `operationalPersonnel` varchar(50) DEFAULT NULL,
  `subordinateDepartments` varchar(50) DEFAULT NULL,
  `STATUS` varchar(1) DEFAULT NULL,
  `reviewPersonnel` varchar(50) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `depothead` */

/*Table structure for table `depotheaddetails` */

DROP TABLE IF EXISTS `depotheaddetails`;

CREATE TABLE `depotheaddetails` (
  `depotheadId` int(11) NOT NULL,
  `NO` int(11) NOT NULL,
  `materialNumber` varchar(50) DEFAULT NULL,
  `materialName` varchar(50) DEFAULT NULL,
  `specificationType` varchar(50) DEFAULT NULL,
  `companyName` varchar(50) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `discounPric` float DEFAULT NULL,
  `foldingNumber` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `money` float DEFAULT NULL,
  `taxRate` float DEFAULT NULL,
  `taxAmount` float DEFAULT NULL,
  `taxableAmount` float DEFAULT NULL,
  `batchMumber` varchar(1) DEFAULT NULL,
  `materialCombination` varchar(1) DEFAULT NULL,
  `gift` varchar(1) DEFAULT NULL,
  `invoiceDetails` varchar(1) DEFAULT NULL,
  `uninvoicedQuantity` int(11) DEFAULT NULL,
  `notesToEntries` text,
  `sourceList` varchar(50) DEFAULT NULL,
  `sourceNo` varchar(50) DEFAULT NULL,
  `customerOrders` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`NO`,`depotheadId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `depotheaddetails` */

/*Table structure for table `depttab` */

DROP TABLE IF EXISTS `depttab`;

CREATE TABLE `depttab` (
  `Depid` int(11) NOT NULL COMMENT '部门编号',
  `Depname` varchar(50) NOT NULL COMMENT '部门名称',
  `Depremark` varchar(200) NOT NULL COMMENT '备注',
  `Deptrash` varchar(50) NOT NULL COMMENT '是否废码',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Depid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

/*Data for the table `depttab` */

/*Table structure for table `dsdaarea` */

DROP TABLE IF EXISTS `dsdaarea`;

CREATE TABLE `dsdaarea` (
  `AreaId` varchar(50) NOT NULL COMMENT '地区编号',
  `AreaName` varchar(50) DEFAULT NULL COMMENT '地区名称',
  `EngName` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `Memo` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`AreaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区';

/*Data for the table `dsdaarea` */

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `Empid` varchar(50) NOT NULL COMMENT '人员编号',
  `Empname` varchar(50) DEFAULT NULL COMMENT '人员姓名',
  `Empename` varchar(50) DEFAULT NULL COMMENT '英文姓名',
  `Depid` varchar(50) DEFAULT NULL COMMENT '部门编号id',
  `Empsex` varchar(50) DEFAULT NULL COMMENT '性别（默认男）',
  `Empcard` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `Empstate` varchar(50) DEFAULT NULL COMMENT '就职状态id',
  `Empduty` varchar(50) DEFAULT NULL COMMENT '职务（改字段名）',
  `Empphoneone` varchar(50) DEFAULT NULL COMMENT '联系电话一',
  `Empphonetwo` varchar(50) DEFAULT NULL COMMENT '联系电话二',
  `Empphonethree` varchar(50) DEFAULT NULL COMMENT '联系电话三',
  `Empbankaccounts` varchar(50) DEFAULT NULL COMMENT '银行账号',
  `Empbirthday` date DEFAULT NULL COMMENT '出生日期(修改数据类型)',
  `Empjob` varchar(50) DEFAULT NULL COMMENT '岗位',
  `Empemail` varchar(50) DEFAULT NULL COMMENT '电子邮件（一个邮箱）',
  `Empweb` varchar(50) DEFAULT NULL COMMENT '网址',
  `Empfaxes` varchar(50) DEFAULT NULL COMMENT '传真号码',
  `Empopenbank` varchar(50) DEFAULT NULL COMMENT '开户银行',
  `Emptop` varchar(50) DEFAULT NULL COMMENT '最高学历',
  `Empdegree` varchar(50) DEFAULT NULL COMMENT '学位',
  `Empgotime` date DEFAULT NULL COMMENT '到期日期',
  `Empgraduatetime` varchar(50) DEFAULT NULL COMMENT '毕业学校',
  `Emppactstarttime` date DEFAULT NULL COMMENT '合同起始日期',
  `Emppactendtime` date DEFAULT NULL COMMENT '合同终止日期',
  `Empnowmailid` varchar(50) DEFAULT NULL COMMENT '现邮编',
  `Empfamilyphone` varchar(50) DEFAULT NULL COMMENT '家庭电话',
  `Empfamilyplace` varchar(50) DEFAULT NULL COMMENT '家庭住址',
  `Empnowphone` varchar(50) DEFAULT NULL COMMENT '现电话',
  `Empnowplace` varchar(50) DEFAULT NULL COMMENT '现住址',
  `Empexigenceman` varchar(50) DEFAULT NULL COMMENT '紧急联系人',
  `Empfamilymailid` varchar(50) DEFAULT NULL COMMENT '家庭邮编',
  `Empremark` varchar(200) DEFAULT NULL COMMENT '备注',
  `Emptrash` int(11) DEFAULT NULL COMMENT '是否废码',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Empid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员表';

/*Data for the table `employee` */

/*Table structure for table `generalledger` */

DROP TABLE IF EXISTS `generalledger`;

CREATE TABLE `generalledger` (
  `Genid` varchar(50) NOT NULL COMMENT '行号',
  `genmaterielid` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `genstorageno` varchar(50) DEFAULT NULL COMMENT '仓库编号',
  `genstoragename` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `genexpectstartqty` varchar(50) DEFAULT NULL COMMENT '物料类别',
  `genstandarcost` varchar(50) DEFAULT NULL COMMENT '单位',
  `gone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `gtwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Genmaterielname` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `Xinghao` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `DATE` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`Genid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存总账表';

/*Data for the table `generalledger` */

/*Table structure for table `listofpurchaseinvoices` */

DROP TABLE IF EXISTS `listofpurchaseinvoices`;

CREATE TABLE `listofpurchaseinvoices` (
  `lineint` varchar(20) NOT NULL COMMENT '详表ID',
  `invoicelist` varchar(20) NOT NULL COMMENT '发票清单表ID',
  `materialint` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `namematerial` varchar(100) DEFAULT NULL COMMENT '物料名称',
  `specificationtype` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `company` varchar(50) DEFAULT NULL COMMENT '单位',
  `invoicequantity` int(11) DEFAULT NULL COMMENT '发票数量',
  `invoiceunitprice` float DEFAULT NULL COMMENT '发票单价',
  `invoiceamount` float DEFAULT NULL COMMENT '发票金额',
  `invoicetaxrate` float DEFAULT NULL COMMENT '发票税率%',
  `invoicetax` float DEFAULT NULL COMMENT '发票税额',
  `invoicetaxableamount` float DEFAULT NULL COMMENT '发票含税金额',
  `sinkdifference` float DEFAULT NULL COMMENT '汇差',
  `spread` float DEFAULT NULL COMMENT '价差',
  `standardcurrency` float DEFAULT NULL COMMENT '价差本位币',
  `totaldifference` float DEFAULT NULL COMMENT '差额合计',
  `sourcelist` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `sourceno` varchar(50) DEFAULT NULL COMMENT '来源单号',
  `notestoentries` varchar(100) DEFAULT NULL COMMENT '分录备注',
  PRIMARY KEY (`lineint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购发票清单表';

/*Data for the table `listofpurchaseinvoices` */

/*Table structure for table `mainlistofpurchaseinvoices` */

DROP TABLE IF EXISTS `mainlistofpurchaseinvoices`;

CREATE TABLE `mainlistofpurchaseinvoices` (
  `storageid` int(9) NOT NULL COMMENT '发票主表ID',
  `citationid` varchar(50) DEFAULT NULL COMMENT '供货商ID',
  `clientsupply` varchar(50) DEFAULT NULL COMMENT '供货商名称',
  `storagedate` date DEFAULT NULL COMMENT '单据日期',
  `documenttype` varchar(50) DEFAULT NULL COMMENT '单据类型',
  `documentint` varchar(50) DEFAULT NULL COMMENT '单据号码',
  `taxincluded` int(11) DEFAULT NULL COMMENT '单价是否含税',
  `invoiceint` varchar(50) DEFAULT NULL COMMENT '发票号码',
  `checkstatus` varchar(50) DEFAULT NULL COMMENT '采购核对状态',
  `invoicetype` int(11) DEFAULT NULL COMMENT '发票类型',
  `voucherint` varchar(50) DEFAULT NULL COMMENT '凭证编号',
  `currency` varchar(50) DEFAULT NULL COMMENT '币别',
  `CertificateNo` varchar(50) DEFAULT NULL COMMENT '差价凭证编号',
  `exchangerate` float DEFAULT NULL COMMENT '汇率',
  `Purchaser` varchar(50) DEFAULT NULL COMMENT '采购人员',
  `subordinatedepartments` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `attributionofaccounts` varchar(50) DEFAULT NULL COMMENT '账款归属',
  `termofpayment` varchar(100) DEFAULT NULL COMMENT '付款条件',
  `daysofpaymentterms` int(11) DEFAULT NULL COMMENT '付款条件天数',
  `dateofpayment` date DEFAULT NULL COMMENT '付款日期',
  `accountmonth` date DEFAULT NULL COMMENT '账款月份',
  `paystrike1` varchar(50) DEFAULT NULL COMMENT '结算方式1',
  `paystrike2` varchar(50) DEFAULT NULL COMMENT '结算方式2',
  `paystrike3` varchar(50) DEFAULT NULL COMMENT '结算方式3',
  `paymoney1` float DEFAULT NULL COMMENT '金额1',
  `paymoney2` float DEFAULT NULL COMMENT '金额2',
  `paymoney3` float DEFAULT NULL COMMENT '金额3',
  `systempersonnel` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `reviewpersonne` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `subordinateprojects` varchar(50) DEFAULT NULL COMMENT '所属项目',
  `enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `isaditing` int(9) DEFAULT NULL COMMENT '是否审核',
  PRIMARY KEY (`storageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购发票表\n';

/*Data for the table `mainlistofpurchaseinvoices` */

/*Table structure for table `materiel` */

DROP TABLE IF EXISTS `materiel`;

CREATE TABLE `materiel` (
  `Matid` varchar(50) NOT NULL COMMENT '物料编号',
  `Matname` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `Matspec` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `Mattypeid` varchar(20) DEFAULT NULL COMMENT '物料类别（伪外键）',
  `Mattypename` varchar(50) DEFAULT NULL COMMENT '物料类别名称',
  `Matadviceprice` float DEFAULT NULL COMMENT '建议售价',
  `Matadvicepricea` float DEFAULT NULL COMMENT '售价A',
  `Matadvicepriceb` float DEFAULT NULL COMMENT '售价B',
  `Matadvicepricec` float DEFAULT NULL COMMENT '售价C',
  `Matadvicepriced` float DEFAULT NULL COMMENT '售价D',
  `Matadvicepricee` float DEFAULT NULL COMMENT '售价E',
  `Matstandardprice` float DEFAULT NULL COMMENT '标准进价',
  `Matshape` varchar(50) DEFAULT NULL COMMENT '物料型态',
  `Matifduty` int(11) DEFAULT NULL COMMENT '是否含税',
  `Matdutyrate` float DEFAULT NULL COMMENT '税率',
  `Matstockaheaddate` int(11) DEFAULT NULL COMMENT '采购提前期',
  `Matmainafford` varchar(50) DEFAULT NULL COMMENT '主供应商',
  `Matmainaffordid` varchar(50) DEFAULT NULL COMMENT '主供应商ID',
  `Matgawpdate` int(11) DEFAULT NULL COMMENT '呆滞起计天数',
  `Matstopdate` date DEFAULT NULL COMMENT '停用日期',
  `Matremark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `Matunit` varchar(50) DEFAULT NULL COMMENT '计量单位',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `ENABLE` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Matid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物料主文件';

/*Data for the table `materiel` */

/*Table structure for table `materieltype` */

DROP TABLE IF EXISTS `materieltype`;

CREATE TABLE `materieltype` (
  `Matypeid` varchar(50) NOT NULL COMMENT '物料类别编号',
  `Matypename` varchar(50) DEFAULT NULL COMMENT '物料类别名称',
  `Matypeengname` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `Matyperemark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  `Column_13` char(10) DEFAULT NULL,
  PRIMARY KEY (`Matypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物料类别';

/*Data for the table `materieltype` */

/*Table structure for table `movedetails` */

DROP TABLE IF EXISTS `movedetails`;

CREATE TABLE `movedetails` (
  `DMdsno` int(11) NOT NULL COMMENT '单号',
  `DMdsmseno` varchar(50) DEFAULT NULL COMMENT '单据号码(单号)',
  `Dmdsmaterieltype` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `Dmdsmaterielname` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `Dmdsmaterielspecs` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `Dmdsmaterielunit` varchar(50) DEFAULT NULL COMMENT '单位',
  `Dmdsmaterielnum` varchar(50) DEFAULT NULL COMMENT '数量',
  `DMdsremark` varchar(50) DEFAULT NULL COMMENT '备注',
  `DMespreservingone` varchar(50) DEFAULT NULL COMMENT '保留字段1',
  `Dmespreservingtwo` varchar(50) DEFAULT NULL COMMENT '保留字段2',
  `Denables` int(11) DEFAULT NULL COMMENT '默认1使用，0：不使用	使用有效期',
  PRIMARY KEY (`DMdsno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调拨单明细表';

/*Data for the table `movedetails` */

/*Table structure for table `moveprice` */

DROP TABLE IF EXISTS `moveprice`;

CREATE TABLE `moveprice` (
  `movedate` date DEFAULT NULL COMMENT '单据日期',
  `moveorderNo` varchar(50) NOT NULL COMMENT '单据号码',
  `moveadjust` varchar(50) DEFAULT NULL COMMENT '增值科目',
  `movestorageNo` varchar(50) DEFAULT NULL COMMENT '仓库编号',
  `movemake` varchar(50) DEFAULT NULL COMMENT '制单人员\n            ',
  `movecheck` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `moveremark` varchar(50) DEFAULT NULL COMMENT '备注',
  `moveAuditingState` int(11) DEFAULT NULL COMMENT '审核状态',
  `safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `safetytwo` varchar(20) DEFAULT NULL COMMENT '保留字段',
  `Moveadjian` varchar(50) DEFAULT NULL COMMENT '减值科目',
  PRIMARY KEY (`moveorderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调价主表';

/*Data for the table `moveprice` */

/*Table structure for table `movepricedetail` */

DROP TABLE IF EXISTS `movepricedetail`;

CREATE TABLE `movepricedetail` (
  `Moveinile` varchar(20) NOT NULL COMMENT '详表ID',
  `moveorderNo` varchar(50) DEFAULT NULL COMMENT '单据号码',
  `Movematerielno` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `Movematerielname` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `Movespectype` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `Moveunit` varchar(50) DEFAULT NULL COMMENT '单位',
  `Movestocks` int(11) DEFAULT NULL COMMENT '库存量',
  `moveaveragecost` int(11) DEFAULT NULL COMMENT '平均成本',
  `moveprice` int(11) DEFAULT NULL COMMENT '单价',
  `movemoveprice` int(11) DEFAULT NULL COMMENT '调价金额',
  `safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`Moveinile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调价明细表';

/*Data for the table `movepricedetail` */

/*Table structure for table `movestorage` */

DROP TABLE IF EXISTS `movestorage`;

CREATE TABLE `movestorage` (
  `Mseno` int(11) NOT NULL COMMENT '单据号码(单号)',
  `msedate` date DEFAULT NULL COMMENT '单据日期',
  `Mseoutstorage` varchar(50) DEFAULT NULL COMMENT '调出库仓（仓库编号）',
  `mseinsertstor` varchar(50) DEFAULT NULL COMMENT '调入库仓（仓库编号）',
  `mseemployee` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `mesAuditingemp` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `Mesremark` varchar(50) DEFAULT NULL COMMENT '备注',
  `messtate` varchar(50) DEFAULT NULL COMMENT '审核状态',
  `Mestrash` varchar(50) DEFAULT NULL COMMENT '是否可用',
  `Mespreservingone` varchar(50) DEFAULT NULL COMMENT '保留字段1',
  `mespreservingtwo` varchar(50) DEFAULT NULL COMMENT '保留字段2',
  `Mespreservingthree` varchar(50) DEFAULT NULL COMMENT '保留字段3',
  PRIMARY KEY (`Mseno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调拨单主表';

/*Data for the table `movestorage` */

/*Table structure for table `othercome` */

DROP TABLE IF EXISTS `othercome`;

CREATE TABLE `othercome` (
  `Othcomeid` varchar(50) NOT NULL COMMENT '单据号码',
  `Othcomedate` date DEFAULT NULL COMMENT '单据日期',
  `othcometypeid` varchar(50) DEFAULT NULL COMMENT '入库类型',
  `Othcomestore` varchar(50) DEFAULT NULL COMMENT '仓库',
  `Othcomename` varchar(50) DEFAULT NULL COMMENT '入库人员',
  `Othcomedept` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `Othcomemakemanid` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `Othcomerepeatuserid` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `tone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `ttwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`Othcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='其它入库主表';

/*Data for the table `othercome` */

/*Table structure for table `othercomedetail` */

DROP TABLE IF EXISTS `othercomedetail`;

CREATE TABLE `othercomedetail` (
  `Othcomeid` varchar(50) DEFAULT NULL COMMENT '单据号码',
  `Othcomeno` varchar(50) NOT NULL COMMENT '栏号',
  `Othcomemertialsid` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `Othcomemertialname` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `Othcometypes` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `Othcomeunits` varchar(50) DEFAULT NULL COMMENT '单位',
  `Othcomeamount` int(11) DEFAULT NULL COMMENT '数量',
  `Othmoney` varchar(50) DEFAULT NULL COMMENT '单价',
  `Jine` int(11) DEFAULT NULL COMMENT '金额',
  `Beizhu` varchar(50) DEFAULT NULL COMMENT '备注',
  `Ziduanone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Ziduantwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`Othcomeno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='其它入库明细表';

/*Data for the table `othercomedetail` */

/*Table structure for table `otheroutdetail` */

DROP TABLE IF EXISTS `otheroutdetail`;

CREATE TABLE `otheroutdetail` (
  `otheroutid` varchar(50) DEFAULT NULL COMMENT '单据号码',
  `Othoutlineno` varchar(50) NOT NULL COMMENT '栏号',
  `Othoutmertialsid` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `Othoutmertialname` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `Othouttypes` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `Othoutunits` varchar(50) DEFAULT NULL COMMENT '单位',
  `Othoutamount` int(11) DEFAULT NULL COMMENT '数量',
  `othoutremark` varchar(50) DEFAULT NULL COMMENT '备注',
  `Tone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Ttwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Ttherr` varchar(50) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`Othoutlineno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='其它出库明细表';

/*Data for the table `otheroutdetail` */

/*Table structure for table `otheroutmain` */

DROP TABLE IF EXISTS `otheroutmain`;

CREATE TABLE `otheroutmain` (
  `Othid` varchar(50) NOT NULL COMMENT '单据号码',
  `Othdate` date DEFAULT NULL COMMENT '单据日期',
  `othouttypeid` varchar(50) DEFAULT NULL COMMENT '出库类型',
  `othstore` varchar(50) DEFAULT NULL COMMENT '仓库',
  `Othoutname` varchar(50) DEFAULT NULL COMMENT '出库人名',
  `Othdept` varchar(50) DEFAULT NULL COMMENT '所属部门',
  `Othmakemanid` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `Othrepeatuserid` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `Oonw` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `otwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `otherr` varchar(50) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`Othid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='其它出库主表 ';

/*Data for the table `otheroutmain` */

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `payid` varchar(20) NOT NULL COMMENT '应付冲款单单号',
  `paydate` date DEFAULT NULL COMMENT '单据日期',
  `purveyid` varchar(20) DEFAULT NULL COMMENT '供应商ID',
  `purveyname` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `paystrike1` varchar(50) DEFAULT NULL COMMENT '结算方式1',
  `paystrike2` varchar(50) DEFAULT NULL COMMENT '结算方式2',
  `paystrike3` varchar(50) DEFAULT NULL COMMENT '结算方式3',
  `paymoney1` float DEFAULT NULL COMMENT '金额1',
  `paymoney2` float DEFAULT NULL COMMENT '金额2',
  `paymoney3` float DEFAULT NULL COMMENT '金额3',
  `paymakeing` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `paydept` varchar(50) DEFAULT NULL COMMENT '制单人所属部门',
  `stodeptid` varchar(50) DEFAULT NULL COMMENT '部门ID （伪ID）',
  `paycheckman` varchar(50) DEFAULT NULL COMMENT '审核人员',
  `payremark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `isaditing` int(9) DEFAULT NULL COMMENT '是否审核',
  `enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  PRIMARY KEY (`payid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应付冲款单主表';

/*Data for the table `payment` */

/*Table structure for table `paymentdetails` */

DROP TABLE IF EXISTS `paymentdetails`;

CREATE TABLE `paymentdetails` (
  `paydetid` varchar(20) NOT NULL COMMENT '详表ID',
  `payid` varchar(20) NOT NULL COMMENT '应付冲款单单号',
  `advdetoddtype` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `originaldate` date DEFAULT NULL COMMENT '原单日期',
  `advdetoddid` varchar(20) DEFAULT NULL COMMENT '原单单号',
  `invoicenumber` varchar(50) DEFAULT NULL COMMENT '发票号码',
  `transactors` varchar(100) DEFAULT NULL COMMENT '交易对象',
  `Transactorsname` varchar(100) DEFAULT NULL COMMENT '交易对象名称',
  `stodeptid` varchar(50) DEFAULT NULL COMMENT '部门编号',
  `departmentname` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `Purchaser` varchar(50) DEFAULT NULL COMMENT '采购人员',
  `entryname` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `formeroddmoney` float DEFAULT NULL COMMENT '原单金额',
  `nocebalance` float DEFAULT NULL COMMENT '现行余额',
  `payzr` float DEFAULT NULL COMMENT '折让金额',
  `paydetmoney` float DEFAULT NULL COMMENT '冲款金额',
  `rushmoney` float DEFAULT NULL COMMENT '冲抵金额',
  `enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  PRIMARY KEY (`paydetid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应付冲款单明细表';

/*Data for the table `paymentdetails` */

/*Table structure for table `procurementinvoicebreakdown` */

DROP TABLE IF EXISTS `procurementinvoicebreakdown`;

CREATE TABLE `procurementinvoicebreakdown` (
  `invoiceddetailsid` int(9) NOT NULL COMMENT '发票明细表ID',
  `lineint` int(11) DEFAULT NULL COMMENT '行号',
  `materialint` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `namematerial` varchar(100) DEFAULT NULL COMMENT '物料名称',
  `specificationtype` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `nameofunit` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `unitprice` float DEFAULT NULL COMMENT '单价',
  `amountofmoney` float DEFAULT NULL COMMENT '金额',
  `taxrate` float DEFAULT NULL COMMENT '税率%',
  `taxamount` float DEFAULT NULL COMMENT '税额',
  `taxableamount` float DEFAULT NULL COMMENT '含税金额',
  `unenteredquantity` int(11) DEFAULT NULL COMMENT '未进数量',
  `purchasingorderint` varchar(50) DEFAULT NULL COMMENT '采购订单号',
  `notestoentries` varchar(50) DEFAULT NULL COMMENT '分录备注',
  PRIMARY KEY (`invoiceddetailsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购发票明细表';

/*Data for the table `procurementinvoicebreakdown` */

/*Table structure for table `provideinfo` */

DROP TABLE IF EXISTS `provideinfo`;

CREATE TABLE `provideinfo` (
  `Peoid` int(11) NOT NULL COMMENT '供应商编号',
  `Peoname` varchar(50) DEFAULT NULL COMMENT '供应商全称',
  `Peoshortname` varchar(50) DEFAULT NULL COMMENT '供应商简称',
  `Peoascription` varchar(50) DEFAULT NULL COMMENT '帐款归属',
  `Peopeeid` varchar(50) DEFAULT NULL COMMENT '供应商类型表id',
  `Peopeename` varchar(50) DEFAULT NULL COMMENT '供应商类型表名称（新增）',
  `Peoarea` varchar(50) DEFAULT NULL COMMENT '地区',
  `Peoprincipal` varchar(50) DEFAULT NULL COMMENT '负责人',
  `Peolinkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `Peophoneone` varchar(50) DEFAULT NULL COMMENT '联系电话一',
  `Peophonetwo` varchar(50) DEFAULT NULL COMMENT '联系电话二',
  `Peomobilephone` varchar(50) DEFAULT NULL COMMENT '移动电话',
  `Peobankaccounts` varchar(50) DEFAULT NULL COMMENT '银行帐号',
  `Peoopenbank` varchar(50) DEFAULT NULL COMMENT '开户银行',
  `Peoempid` varchar(50) DEFAULT NULL COMMENT '（业务人员编号）',
  `Peoempname` varchar(50) DEFAULT NULL COMMENT '（业务人员名称）',
  `Peocalling` varchar(50) DEFAULT NULL COMMENT '行业别',
  `Peoemail` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `Peoweb` varchar(50) DEFAULT NULL COMMENT '网址',
  `Peofaxes` varchar(50) DEFAULT NULL COMMENT '传真号码',
  `Peocreatedate` varchar(50) DEFAULT NULL COMMENT '建立日期',
  `Peocreditclass` varchar(50) DEFAULT NULL COMMENT '信用等级',
  `Peozhangkuanedu` decimal(10,2) DEFAULT NULL COMMENT '帐款额度',
  `Peoremainedu` decimal(10,2) DEFAULT NULL COMMENT '剩余额度',
  `Peomonthreckoning` decimal(10,2) DEFAULT NULL COMMENT '每月结帐日',
  `Peoqcprepaymoney` decimal(10,2) DEFAULT NULL COMMENT '期初预付款',
  `Peoqcdealmoney` decimal(10,2) DEFAULT NULL COMMENT '期初应付款',
  `Peoqmprepaymoney` decimal(10,2) DEFAULT NULL COMMENT '期末预付款',
  `Peoqmdealmoney` decimal(10,2) DEFAULT NULL COMMENT '期末应付款',
  `Peoremark` varchar(200) DEFAULT NULL COMMENT '备注',
  `Peotrash` int(11) DEFAULT NULL COMMENT '是否废码',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Peoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商主文件表';

/*Data for the table `provideinfo` */

/*Table structure for table `recededetails` */

DROP TABLE IF EXISTS `recededetails`;

CREATE TABLE `recededetails` (
  `Recid` varchar(20) NOT NULL COMMENT '采购退货单号(stockrecede外键)',
  `Matid` varchar(50) DEFAULT NULL COMMENT '物料编号(非外键)',
  `Matname` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `Matspec` varchar(20) DEFAULT NULL COMMENT '规格型号',
  `Detnum` int(11) DEFAULT NULL COMMENT '数量',
  `Detagioprice` float DEFAULT NULL COMMENT '折扣前单价',
  `Detdiscount` int(11) DEFAULT NULL COMMENT '折数',
  `Detprice` float DEFAULT NULL COMMENT '单价',
  `Detamtmoney` float DEFAULT NULL COMMENT '金额',
  `Depcess` int(11) DEFAULT NULL COMMENT '税率',
  `Depcessmoney` float DEFAULT NULL COMMENT '税额',
  `Deplargess` int(11) DEFAULT NULL COMMENT '是否赠品',
  `Sodorigintype` varchar(20) DEFAULT NULL COMMENT '来源单别',
  `Sodorigin` varchar(20) DEFAULT NULL COMMENT '来源单号',
  `Enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Recid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购退货明细表';

/*Data for the table `recededetails` */

/*Table structure for table `revenuechargetype` */

DROP TABLE IF EXISTS `revenuechargetype`;

CREATE TABLE `revenuechargetype` (
  `FareClassId` varchar(50) NOT NULL COMMENT '编号',
  `FareClassName` varchar(50) DEFAULT NULL COMMENT '名称',
  `EngName` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `AccSubjectId` varchar(50) DEFAULT NULL COMMENT '会计科目',
  `AccSubjectName` varchar(50) DEFAULT NULL COMMENT '科目名称',
  `Memo` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FareClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收入费用类型';

/*Data for the table `revenuechargetype` */

/*Table structure for table `saleaccountdetails` */

DROP TABLE IF EXISTS `saleaccountdetails`;

CREATE TABLE `saleaccountdetails` (
  `Minusaddid` int(11) NOT NULL COMMENT '主键ID',
  `Sinid` int(11) NOT NULL COMMENT '来源单别',
  `Sinname` varchar(50) NOT NULL COMMENT '来源单别名称',
  `Originbillid` varchar(20) NOT NULL COMMENT '来源单号',
  `Nowdate` date NOT NULL COMMENT '来源单据日期',
  `Cliid` int(11) NOT NULL COMMENT '客户编号client(cliid)',
  `Showdate` date NOT NULL COMMENT '日期',
  `Originoddmoney` float NOT NULL COMMENT '原单金额',
  `Currentlybalance` float NOT NULL COMMENT '现行余额',
  `Remark` varchar(2000) NOT NULL COMMENT '备注',
  `Enables` int(11) NOT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) NOT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) NOT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Minusaddid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账款明细表';

/*Data for the table `saleaccountdetails` */

/*Table structure for table `sell_order` */

DROP TABLE IF EXISTS `sell_order`;

CREATE TABLE `sell_order` (
  `bill_id` varchar(50) NOT NULL COMMENT '单据号码',
  `bill_date` date DEFAULT NULL COMMENT '单据日期',
  `bill_type` varchar(50) DEFAULT NULL COMMENT '销售订单类型',
  `chi_order` varchar(50) DEFAULT NULL COMMENT '客户订单',
  `chiplace` varchar(50) DEFAULT NULL COMMENT '地址',
  `order_status` int(11) DEFAULT NULL COMMENT '单况（1.未结案。2.已结案 3.已无效）',
  `currency` int(11) DEFAULT NULL COMMENT '币别',
  `price_whether_tax` tinyint(1) DEFAULT NULL COMMENT '单价是否含税',
  `emp_id` int(11) DEFAULT NULL COMMENT '业务人员编号',
  `emp_name` varchar(50) DEFAULT NULL COMMENT '业务人员姓名',
  `dep_id` int(11) DEFAULT NULL COMMENT '部门编号',
  `dep_name` varchar(50) DEFAULT NULL COMMENT '部门名字',
  `mark_emp_name` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `auditing_emp_name` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `check_state` int(11) DEFAULT NULL COMMENT '0未审核  1已审核',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `collection_terms` int(11) DEFAULT NULL COMMENT '收款条件(外键)',
  `collection_day` int(11) DEFAULT NULL COMMENT '收款天数',
  `collection_date` date DEFAULT NULL COMMENT '收款日期',
  `belong_project` int(11) DEFAULT NULL COMMENT '所属项目(外键)',
  `is_exist` int(11) DEFAULT NULL COMMENT '是否已被删除',
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售订单表';

/*Data for the table `sell_order` */

/*Table structure for table `sell_order_item` */

DROP TABLE IF EXISTS `sell_order_item`;

CREATE TABLE `sell_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增列',
  `bill_id` varchar(50) DEFAULT NULL COMMENT '主单据号',
  `mat_id` int(11) DEFAULT NULL COMMENT '物料编号',
  `mat_name` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `mat_spec` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `mat_unit` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `agio_ago_price` float DEFAULT NULL COMMENT '折扣前单价',
  `agio` int(11) DEFAULT NULL COMMENT '折数（默认100）',
  `price` float DEFAULT NULL COMMENT '单价',
  `money` float DEFAULT NULL COMMENT '金额',
  `cess` int(11) DEFAULT NULL COMMENT '税率（默认17）',
  `taxmoney` float DEFAULT NULL COMMENT '税额',
  `intaxmoney` float DEFAULT NULL COMMENT '含税金额',
  `present` tinyint(1) DEFAULT NULL COMMENT '是否赠品',
  `fact_cost` float DEFAULT NULL COMMENT '实际成本',
  `criterion_cost` float DEFAULT NULL COMMENT '标准成本',
  `out_tiem` date DEFAULT NULL COMMENT '预出库日',
  `no_out_number` int(11) DEFAULT NULL COMMENT '未出库数量',
  `mat_group` tinyint(1) DEFAULT NULL COMMENT '物料组合',
  `sin_name` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `origin_bill_id` varchar(50) DEFAULT NULL COMMENT '来源单号',
  `production` tinyint(1) DEFAULT NULL COMMENT '生产',
  `production_number` int(11) DEFAULT NULL COMMENT '以生产数量',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `is_exit` tinyint(1) DEFAULT NULL COMMENT '是否已被删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售订单详细表';

/*Data for the table `sell_order_item` */

/*Table structure for table `sell_quote` */

DROP TABLE IF EXISTS `sell_quote`;

CREATE TABLE `sell_quote` (
  `bill_id` varchar(50) NOT NULL COMMENT '单价号码',
  `bill_date` date DEFAULT NULL COMMENT '单击日期',
  `CLIENT` varchar(50) DEFAULT NULL COMMENT '客户编号',
  `cli_short_name` varchar(50) DEFAULT NULL COMMENT '客户简称',
  `cli_place_id` int(11) DEFAULT NULL COMMENT '地址编号',
  `cli_place` varchar(50) DEFAULT NULL COMMENT '客户地址',
  `order_status` int(11) DEFAULT NULL COMMENT '1.未结案。2.已结案 3.已无效',
  `currency` int(11) DEFAULT NULL COMMENT '币别',
  `price_whether_tax` tinyint(1) DEFAULT NULL COMMENT '单价是否含税',
  `emp_id` int(11) DEFAULT NULL COMMENT '业务人员编号',
  `emp_name` varchar(50) DEFAULT NULL COMMENT '业务人员姓名',
  `dep_id` int(11) DEFAULT NULL COMMENT '部门编号',
  `dep_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `make_emp_name` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `auditing_emp_name` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `check_state` int(11) DEFAULT NULL COMMENT '0.未审核  1.已审核',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `total_money` float DEFAULT NULL COMMENT '合计金额',
  `tatal_tax` float DEFAULT NULL COMMENT '合计税额',
  `total_tax_money` float DEFAULT NULL COMMENT '合计含税金额',
  `is_exist` tinyint(1) DEFAULT NULL COMMENT '是否已删除',
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售报价主表';

/*Data for the table `sell_quote` */

/*Table structure for table `sell_quote_item` */

DROP TABLE IF EXISTS `sell_quote_item`;

CREATE TABLE `sell_quote_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增列',
  `bill_id` varchar(50) DEFAULT NULL COMMENT '主单据号',
  `mat_name` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `mat_spec` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `mat_unit` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `agio_ago_price` float DEFAULT NULL COMMENT '折扣前单价',
  `agio` int(11) DEFAULT NULL COMMENT '默认100',
  `price` float DEFAULT NULL COMMENT '单价',
  `money` float DEFAULT NULL COMMENT '金额',
  `cess` int(11) DEFAULT NULL COMMENT '税率（默认17）',
  `taxmoney` float DEFAULT NULL COMMENT '税额',
  `intaxmoney` float DEFAULT NULL COMMENT '含税金额',
  `present` tinyint(1) DEFAULT NULL COMMENT '是否赠品',
  `fact_cost` float DEFAULT NULL COMMENT '实际成本',
  `criterion_cost` float DEFAULT NULL COMMENT '标准成本',
  `is_exit` tinyint(1) DEFAULT NULL COMMENT '是否已被删除',
  `remark` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售报价单详细表	';

/*Data for the table `sell_quote_item` */

/*Table structure for table `sellinvoice` */

DROP TABLE IF EXISTS `sellinvoice`;

CREATE TABLE `sellinvoice` (
  `bill_id` varchar(50) NOT NULL COMMENT '单据号码',
  `bill_date` date DEFAULT NULL COMMENT '单据日期',
  `bill_type` varchar(50) DEFAULT NULL COMMENT '单据类型',
  `chi_id` int(50) DEFAULT NULL COMMENT '客户id',
  `chi_name` varchar(50) DEFAULT NULL COMMENT '客户姓名',
  `sell_check_state` int(11) DEFAULT NULL COMMENT '销售核对状态',
  `check_state` int(11) DEFAULT NULL COMMENT '0未审核  1已审核',
  `currency` int(11) DEFAULT NULL COMMENT '币别',
  `price_whether_tax` tinyint(1) DEFAULT NULL COMMENT '单价是否含税',
  `emp_id` int(11) DEFAULT NULL COMMENT '业务人员编号',
  `emp_name` varchar(50) DEFAULT NULL COMMENT '业务人员姓名',
  `dep_id` int(11) DEFAULT NULL COMMENT '部门编号',
  `dep_name` varchar(50) DEFAULT NULL COMMENT '部门名字',
  `mark_emp_name` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `auditing_emp_name` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `collection_terms` int(11) DEFAULT NULL COMMENT '收款条件(外键)',
  `collection_day` int(11) DEFAULT NULL COMMENT '收款天数',
  `collection_date` date DEFAULT NULL COMMENT '收款日期',
  `belong_project` int(11) DEFAULT NULL COMMENT '所属项目(外键)',
  `is_exist` int(11) DEFAULT NULL COMMENT '是否已被删除',
  `invoice_id` int(11) DEFAULT NULL COMMENT '发票类型id',
  `invoice_number` varchar(50) DEFAULT NULL COMMENT '发票号码',
  `settle_way_one` varchar(50) DEFAULT NULL COMMENT '结算方式1',
  `settle_money_one` float DEFAULT NULL COMMENT '结算方式1金额',
  `settle_way_two` varchar(50) DEFAULT NULL COMMENT '结算方式2',
  `settle_money_two` float DEFAULT NULL COMMENT '结算方式2金额',
  PRIMARY KEY (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售发票表';

/*Data for the table `sellinvoice` */

/*Table structure for table `sellinvoiceitem` */

DROP TABLE IF EXISTS `sellinvoiceitem`;

CREATE TABLE `sellinvoiceitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增列',
  `bill_id` varchar(50) DEFAULT NULL COMMENT '主单据号',
  `mat_name` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `mat_spec` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `mat_unit` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `agio` int(11) DEFAULT NULL COMMENT '默认100',
  `price` float DEFAULT NULL COMMENT '单价',
  `money` float DEFAULT NULL COMMENT '金额',
  `cess` int(11) DEFAULT NULL COMMENT '税率（默认17）',
  `taxmoney` float DEFAULT NULL COMMENT '税额',
  `intaxmoney` float DEFAULT NULL COMMENT '含税金额',
  `no_out_number` int(11) DEFAULT NULL COMMENT '未出库数量',
  `sell_order` varchar(50) DEFAULT NULL COMMENT '销售订单号',
  `remark` varchar(50) DEFAULT NULL COMMENT '分录备注',
  `is_exit` int(3) DEFAULT NULL COMMENT '是否已被删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售发票详细表';

/*Data for the table `sellinvoiceitem` */

/*Table structure for table `sellinvoicelist` */

DROP TABLE IF EXISTS `sellinvoicelist`;

CREATE TABLE `sellinvoicelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增列',
  `bill_id` varchar(50) DEFAULT NULL COMMENT '主发票单据号',
  `mat_name` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `mat_spec` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `mat_unit` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `agio` int(11) DEFAULT NULL COMMENT '默认100',
  `price` float DEFAULT NULL COMMENT '单价',
  `money` float DEFAULT NULL COMMENT '金额',
  `cess` int(11) DEFAULT NULL COMMENT '税率（默认17）',
  `taxmoney` float DEFAULT NULL COMMENT '税额',
  `intaxmoney` float DEFAULT NULL COMMENT '含税金额',
  `no_out_number` int(11) DEFAULT NULL COMMENT '未出库数量',
  `sin_name` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `origin_bill_id` varchar(50) DEFAULT NULL COMMENT '来源单号',
  `remark` varchar(50) DEFAULT NULL COMMENT '分录备注',
  `is_exit` int(3) DEFAULT NULL COMMENT '是否已被删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='销售发票清单表';

/*Data for the table `sellinvoicelist` */

/*Table structure for table `stagnation` */

DROP TABLE IF EXISTS `stagnation`;

CREATE TABLE `stagnation` (
  `Sid` int(20) NOT NULL COMMENT '主键ID',
  `Sbh` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `sname` varchar(50) DEFAULT NULL COMMENT '物料的名称',
  `sxinghao` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `sleibiename` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `sdanweiname` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `sdata` date DEFAULT NULL COMMENT '最近入库时间',
  `son` varchar(50) DEFAULT NULL COMMENT '备用1',
  `stwo` varchar(50) DEFAULT NULL COMMENT '备用2',
  `sthree` varchar(50) DEFAULT NULL COMMENT '备用2',
  PRIMARY KEY (`Sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存呆滞分析表';

/*Data for the table `stagnation` */

/*Table structure for table `stockapply` */

DROP TABLE IF EXISTS `stockapply`;

CREATE TABLE `stockapply` (
  `Appid` varchar(20) NOT NULL COMMENT '请购单编号',
  `Appdate` date NOT NULL COMMENT '请购单日期',
  `Apptype` varchar(50) NOT NULL COMMENT '请购采购类型',
  `Appcircs` int(11) NOT NULL COMMENT '单况：已结案/未结案/无效',
  `Appperson` varchar(50) NOT NULL COMMENT '请购人员',
  `Apppersonid` varchar(50) NOT NULL COMMENT '伪外键：请购人员id',
  `Appdept` varchar(50) NOT NULL COMMENT '请购部门',
  `Appdeptid` varchar(50) NOT NULL COMMENT '伪外键：请购部门id',
  `Appmaker` varchar(50) NOT NULL COMMENT '制单人员',
  `Appauditingperson` varchar(50) NOT NULL COMMENT '复核人员',
  `Appauditing` varchar(50) NOT NULL COMMENT '审核状态：未审核/已审核/无效',
  `Stockapplyname` varchar(50) NOT NULL COMMENT '保存（“采购请购”）',
  `Enables` int(11) DEFAULT '1' COMMENT '标识是否删除',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段 保存（“采购请购”）',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购请购主表';

/*Data for the table `stockapply` */

insert  into `stockapply`(`Appid`,`Appdate`,`Apptype`,`Appcircs`,`Appperson`,`Apppersonid`,`Appdept`,`Appdeptid`,`Appmaker`,`Appauditingperson`,`Appauditing`,`Stockapplyname`,`Enables`,`Safetyone`,`Safetytwo`,`Extend0`,`Extend1`,`Extend2`,`Extend3`,`Extend4`) values ('1','2019-08-30','1',3,'','1','','','1','1','1','',0,'','',NULL,NULL,NULL,NULL,NULL),('111','2019-08-30','11',3,'','1','','','1','1','1','',0,'','',NULL,NULL,NULL,NULL,NULL),('2019082901','2019-08-29','整机',3,'','1','','','1','1','1','',0,'','',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `stockapplydetails` */

DROP TABLE IF EXISTS `stockapplydetails`;

CREATE TABLE `stockapplydetails` (
  `TockapplyDetails` varchar(50) NOT NULL COMMENT '请购详情编号',
  `Appid` varchar(20) NOT NULL COMMENT '请购单编号',
  `Apdmateridlid` varchar(50) DEFAULT NULL COMMENT '物料编号(伪外：物料主文件)',
  `Apdmateridlname` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `Apdmodel` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `Apdunit` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `Apdnum` int(11) DEFAULT NULL COMMENT '数量',
  `Apdstandardprice` float DEFAULT NULL COMMENT '标准进价',
  `Apdstandardmoney` float DEFAULT NULL COMMENT '标准进价金额',
  `Apdprice` float DEFAULT NULL COMMENT '单价',
  `Apdintomoney` float DEFAULT NULL COMMENT '进价金额',
  `Apddemanddate` date DEFAULT NULL COMMENT '需求日期',
  `Apdstockdate` date DEFAULT NULL COMMENT '建议采购日期',
  `Apdnotnum` int(11) DEFAULT NULL COMMENT '未采购数量',
  `Apdoriginid` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `Apdorigintype` varchar(20) DEFAULT NULL COMMENT '来源单号',
  `Apdremark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `Enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`TockapplyDetails`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购请购明细表';

/*Data for the table `stockapplydetails` */

insert  into `stockapplydetails`(`TockapplyDetails`,`Appid`,`Apdmateridlid`,`Apdmateridlname`,`Apdmodel`,`Apdunit`,`Apdnum`,`Apdstandardprice`,`Apdstandardmoney`,`Apdprice`,`Apdintomoney`,`Apddemanddate`,`Apdstockdate`,`Apdnotnum`,`Apdoriginid`,`Apdorigintype`,`Apdremark`,`Enables`,`Safetyone`,`Safetytwo`,`Extend0`,`Extend1`,`Extend2`,`Extend3`,`Extend4`) values ('00101','001','A01','物料mingz','','个',10,999,999,999,999,'2019-08-30','2019-08-30',10,'','','备注',NULL,'测试修改','测试修改',NULL,NULL,NULL,NULL,NULL),('00102','001','A01','物料mingz','','个',10,999,999,999,999,'2019-08-30','2019-08-30',10,'','','备注',NULL,'测试修改','测试修改',NULL,NULL,NULL,NULL,NULL),('101','1','A01','物料mingz','','个',10,999,999,999,999,'2019-08-30','2019-08-30',10,'','','备注',NULL,'','',NULL,NULL,NULL,NULL,NULL),('102','1','A01','物料mingz','','个',10,999,999,999,999,'2019-08-30','2019-08-30',10,'','','备注',NULL,'','',NULL,NULL,NULL,NULL,NULL),('11101','111','A01','物料mingz','','个',1,999,999,999,999,'2019-08-30','2019-08-30',10,'','','备注',NULL,'','',NULL,NULL,NULL,NULL,NULL),('11102','111','A01','物料mingz','','个',2,999,999,999,999,'2019-08-30','2019-08-30',10,'','','备注',NULL,'','',NULL,NULL,NULL,NULL,NULL),('11103','111',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `stockapplytype` */

DROP TABLE IF EXISTS `stockapplytype`;

CREATE TABLE `stockapplytype` (
  `Aptid` varchar(20) NOT NULL COMMENT '类型编号',
  `Aptname` varchar(50) NOT NULL COMMENT '类型名称',
  `Aptename` varchar(50) NOT NULL COMMENT '英文名称',
  `Aptremark` varchar(2000) NOT NULL COMMENT '备注',
  `ENABLE` int(11) NOT NULL COMMENT '标识是否删除',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Aptid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购请购类型表';

/*Data for the table `stockapplytype` */

/*Table structure for table `stockapportion` */

DROP TABLE IF EXISTS `stockapportion`;

CREATE TABLE `stockapportion` (
  `Appid` varchar(20) NOT NULL COMMENT '采购分摊单号',
  `Appdate` date DEFAULT NULL COMMENT '分摊日期',
  `Wisname` varchar(50) DEFAULT NULL COMMENT '分摊方式',
  `Appamtmoney` float DEFAULT NULL COMMENT '待摊金额',
  `Makeperson` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `Auditingperson` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `Estate` varchar(50) DEFAULT NULL COMMENT '是否已审核',
  `Enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购分摊主表';

/*Data for the table `stockapportion` */

/*Table structure for table `stockinquire` */

DROP TABLE IF EXISTS `stockinquire`;

CREATE TABLE `stockinquire` (
  `Stoid` varchar(20) NOT NULL COMMENT '询价单编号',
  `Stopname` varchar(50) NOT NULL COMMENT '供应商',
  `Stopid` varchar(50) NOT NULL COMMENT '伪外键(供应商主文件)',
  `Stopaddress` varchar(100) NOT NULL COMMENT '供应商地址',
  `Sotdate` date NOT NULL COMMENT '单据日期',
  `Stoavdate` date NOT NULL COMMENT '有效日期',
  `Stoistax` varchar(50) NOT NULL COMMENT '是否含税(含税/未含税)',
  `Stodaddress` varchar(100) NOT NULL COMMENT '送货地址',
  `Stomakeperson` varchar(50) NOT NULL COMMENT '制单人员',
  `Stoauditingperson` varchar(50) NOT NULL COMMENT '复核人员',
  `Stostockperson` varchar(50) NOT NULL COMMENT '采购人员',
  `Stopersonid` varchar(50) NOT NULL COMMENT '伪外键(请购人员外键)',
  `Stodept` varchar(50) NOT NULL COMMENT '所属部门',
  `Stodeptid` varchar(50) NOT NULL COMMENT '伪外键(所属部门外键)',
  `Stoauditing` varchar(50) NOT NULL COMMENT '审核状态：未审核/已审核/无效',
  `Stockinquirename` varchar(50) NOT NULL COMMENT '保存（“采购询价单”）',
  `Enables` int(11) NOT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) NOT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) NOT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Stoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购询价主表';

/*Data for the table `stockinquire` */

/*Table structure for table `stockinquiredetails` */

DROP TABLE IF EXISTS `stockinquiredetails`;

CREATE TABLE `stockinquiredetails` (
  `Sdarows` varchar(11) NOT NULL COMMENT '行号',
  `Stoid` varchar(20) NOT NULL COMMENT '询价单编号',
  `Sdamaterielid` varchar(50) NOT NULL COMMENT '物料编号',
  `Sdamateridlname` varchar(50) NOT NULL COMMENT '物料名称',
  `Sdamodel` varchar(50) NOT NULL COMMENT '规格型号',
  `Sdaunit` varchar(50) NOT NULL COMMENT '单位名称',
  `Sdanum` int(11) NOT NULL COMMENT '数量',
  `Sdaagioes` float NOT NULL COMMENT '折前单价',
  `Sdaagiocess` int(11) NOT NULL COMMENT '折数(%)',
  `Sdaprice` float NOT NULL COMMENT '单价',
  `Sdamoney` float NOT NULL COMMENT '金额',
  `Sdacess` int(11) NOT NULL COMMENT '税率(%)',
  `Sdataxmoney` float NOT NULL COMMENT '税额',
  `Sdataxmoneys` float NOT NULL COMMENT '含税金额',
  `Sdaislargess` int(11) NOT NULL COMMENT '赠品：是/否',
  `Sdaoriginid` varchar(20) NOT NULL COMMENT '来源单号',
  `Sdaorigintype` varchar(50) NOT NULL COMMENT '来源单别',
  `Sdaremark` varchar(2000) NOT NULL COMMENT '备注',
  `Enables` int(11) NOT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) NOT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) NOT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Sdarows`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购询价明细表';

/*Data for the table `stockinquiredetails` */

/*Table structure for table `stockorder` */

DROP TABLE IF EXISTS `stockorder`;

CREATE TABLE `stockorder` (
  `Stoid` varchar(20) NOT NULL COMMENT '单据号',
  `Stodate` date NOT NULL COMMENT '日期',
  `Stopeoname` varchar(50) NOT NULL COMMENT '供货商',
  `Stopeoid` varchar(50) NOT NULL COMMENT '供货商编号',
  `Stopeoadress` varchar(50) DEFAULT NULL COMMENT '供货商地址',
  `Stoistax` varchar(20) NOT NULL COMMENT '单价是否含税：1-含税，2-未税',
  `Stostate` int(11) NOT NULL COMMENT '单况：1-未结案，2-已结案，3-无效',
  `Stoadress` varchar(50) DEFAULT NULL COMMENT '送货地址',
  `Stoempstock` varchar(50) NOT NULL COMMENT '采购人员',
  `Stopersonid` varchar(50) NOT NULL COMMENT '伪外键:采购人员id',
  `Stodept` varchar(50) NOT NULL COMMENT '采购部门',
  `Stodeptid` varchar(50) NOT NULL COMMENT '伪外键:部门id',
  `Stoempname` varchar(50) NOT NULL COMMENT '制单人员',
  `Stoempcheck` varchar(50) NOT NULL COMMENT '复核人员',
  `Stomark` varchar(2000) NOT NULL COMMENT '备注',
  `Checkstate` int(11) NOT NULL COMMENT '审核状态',
  `Stockordername` varchar(50) NOT NULL COMMENT '保存（采购订单）',
  `Enables` int(11) NOT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Stoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购订单主表';

/*Data for the table `stockorder` */

/*Table structure for table `stockorderdetails` */

DROP TABLE IF EXISTS `stockorderdetails`;

CREATE TABLE `stockorderdetails` (
  `Sodlineid` varchar(11) NOT NULL COMMENT '栏号',
  `Sodid` varchar(20) NOT NULL COMMENT '单据号',
  `Sodmaterielid` varchar(50) NOT NULL COMMENT '物料编号',
  `Sodmatid` varchar(20) NOT NULL COMMENT '(物料名称)',
  `Sodspec` varchar(50) NOT NULL COMMENT '(规格型号)',
  `Sodamount` int(11) NOT NULL COMMENT '数量',
  `Sodpreprice` float NOT NULL COMMENT '折扣前单价',
  `Sodagio` int(11) NOT NULL COMMENT '折数（%）',
  `Sodprice` float NOT NULL COMMENT '单价',
  `Sodsum` float NOT NULL COMMENT '金额',
  `Sodcess` int(11) NOT NULL COMMENT '税率（%）',
  `Sodsumcess` float NOT NULL COMMENT '(税额)',
  `Sodsumprice` float NOT NULL COMMENT '(含税金额）',
  `Sodpreincomestorage` date NOT NULL COMMENT '预入库日',
  `Sodpresent` varchar(4) NOT NULL COMMENT '是否赠品',
  `Sodorigintype` varchar(20) NOT NULL COMMENT '(来源单别)',
  `Sodorigin` varchar(20) NOT NULL COMMENT '(来源单号)',
  `Enables` int(11) NOT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) NOT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) NOT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Sodlineid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购订单明细表';

/*Data for the table `stockorderdetails` */

/*Table structure for table `stockrecede` */

DROP TABLE IF EXISTS `stockrecede`;

CREATE TABLE `stockrecede` (
  `Recid` varchar(20) NOT NULL COMMENT '采购退货单号',
  `Recdate` date DEFAULT NULL COMMENT '单据日期',
  `Peoid` varchar(50) DEFAULT NULL COMMENT '供应商编号',
  `Purveyname` varchar(50) DEFAULT NULL COMMENT '供货商名称',
  `Peoaddress` varchar(50) DEFAULT NULL COMMENT '供应商地址',
  `Stoid` varchar(20) DEFAULT NULL COMMENT '仓库编号',
  `Depotname` varchar(20) DEFAULT NULL COMMENT '仓库名称',
  `Containtax` int(11) DEFAULT NULL COMMENT '单价是否含税',
  `Anewstorage` int(11) DEFAULT NULL COMMENT '是否重新入库',
  `Stoperson` varchar(50) DEFAULT NULL COMMENT '采购人员姓名',
  `Stopersonid` varchar(50) DEFAULT NULL COMMENT '采购人员ID',
  `Stodept` varchar(50) DEFAULT NULL COMMENT '请购部门',
  `Stodeptid` varchar(50) DEFAULT NULL COMMENT '部门编号',
  `Makeperson` varchar(50) DEFAULT NULL COMMENT '制单人员',
  `Auditingperson` varchar(50) DEFAULT NULL COMMENT '复核人员',
  `Recremark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `Estate` varchar(50) DEFAULT NULL COMMENT '单据状态( 是否已经审核)',
  `Stockrecedename` varchar(50) DEFAULT NULL COMMENT '保存（“采购退货单”）',
  `Enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩?棺侄?',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Recid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购退货主表';

/*Data for the table `stockrecede` */

/*Table structure for table `stockstoragedetails` */

DROP TABLE IF EXISTS `stockstoragedetails`;

CREATE TABLE `stockstoragedetails` (
  `StockstorageDetail` varchar(20) NOT NULL COMMENT '详表ID',
  `Storagedetailno` varchar(20) NOT NULL COMMENT '引用采购入库单单号',
  `Materielid` varchar(50) DEFAULT NULL COMMENT '引用物料文件ID',
  `Materielname` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `TYPES` varchar(20) DEFAULT NULL COMMENT '规格型号',
  `Units` varchar(20) DEFAULT NULL COMMENT '单位',
  `Amount` int(11) DEFAULT NULL COMMENT '数量',
  `Rebateprice` float DEFAULT NULL COMMENT '折扣前单价',
  `Rebate` float DEFAULT NULL COMMENT '折扣',
  `Unitprice` float DEFAULT NULL COMMENT '单价',
  `Moneys` float DEFAULT NULL COMMENT '金额',
  `Cess` float DEFAULT NULL COMMENT '税率',
  `Tax` float DEFAULT NULL COMMENT '税额',
  `Taxmoneys` float DEFAULT NULL COMMENT '含税金额',
  `Origintype` varchar(20) DEFAULT NULL COMMENT '来源单别',
  `Originno` varchar(20) DEFAULT NULL COMMENT '来源单号',
  `Present` varchar(20) DEFAULT NULL COMMENT '是否赠品',
  `Apportionmoney` float DEFAULT NULL COMMENT '分摊费用',
  `Enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`StockstorageDetail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购入库明细';

/*Data for the table `stockstoragedetails` */

/*Table structure for table `stockstoragetable` */

DROP TABLE IF EXISTS `stockstoragetable`;

CREATE TABLE `stockstoragetable` (
  `Stockstorageno` varchar(20) NOT NULL COMMENT '单号（自动生成）',
  `Storagedate` date DEFAULT NULL COMMENT '单据日期',
  `Purveyid` varchar(50) DEFAULT NULL COMMENT '供货商ID',
  `Purveyname` varchar(50) DEFAULT NULL COMMENT '供货商名称',
  `Purveyaddress` varchar(50) DEFAULT NULL COMMENT '供货商地址',
  `Depotid` varchar(50) DEFAULT NULL COMMENT '仓库ID',
  `Depotname` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `Pricerevenue` varchar(20) DEFAULT NULL COMMENT '单价是否含税',
  `Stoperson` varchar(50) DEFAULT NULL COMMENT '采购人员',
  `Stodept` varchar(50) DEFAULT NULL COMMENT '采购人员所属部门名称',
  `Stodeptid` varchar(50) DEFAULT NULL COMMENT '部门ID',
  `Audituserid` varchar(50) DEFAULT NULL COMMENT '审核人员ID',
  `Repeatuserid` varchar(50) DEFAULT NULL COMMENT '复核人员ID',
  `Remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `Estate` int(11) DEFAULT NULL COMMENT '单据状态（是否以审核）',
  `Stockstoragetablename` varchar(50) DEFAULT NULL COMMENT '保存（“采购入库单”）',
  `Enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Stockstorageno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购入库主表';

/*Data for the table `stockstoragetable` */

/*Table structure for table `storage` */

DROP TABLE IF EXISTS `storage`;

CREATE TABLE `storage` (
  `Stoid` varchar(50) NOT NULL COMMENT '仓库编号',
  `Stoname` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `Stosimplename` varchar(50) DEFAULT NULL COMMENT '仓库简称',
  `Stoconnectper` varchar(50) DEFAULT NULL COMMENT '联系人',
  `Stoempid` varchar(50) DEFAULT NULL COMMENT '联系人ID(新增)',
  `Stophone` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `Stoaddress` varchar(50) DEFAULT NULL COMMENT '仓库地址',
  `Storemark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `Safetyone` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Safetytwo` varchar(50) DEFAULT NULL COMMENT '保留字段',
  `Enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Stoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库表';

/*Data for the table `storage` */

/*Table structure for table `supplieraddress` */

DROP TABLE IF EXISTS `supplieraddress`;

CREATE TABLE `supplieraddress` (
  `suaddrId` varchar(50) NOT NULL COMMENT '供应商地址id',
  `suaddress` varchar(50) DEFAULT NULL COMMENT '供应商地址',
  `suzipcode` varchar(50) DEFAULT NULL COMMENT '邮政编码',
  `sulinkman` varchar(50) DEFAULT NULL COMMENT '联系人',
  `sulinkmanprof` varchar(50) DEFAULT NULL COMMENT '联系人职称',
  `sutelephone` varchar(50) DEFAULT NULL COMMENT '联系人电话',
  `sufaxno` varchar(50) DEFAULT NULL COMMENT '传真号码',
  `suwalkaddr` varchar(50) DEFAULT NULL COMMENT '行走路线',
  `sumemo` varchar(50) DEFAULT NULL COMMENT '备注',
  `peoid` int(11) DEFAULT NULL COMMENT '供应商id',
  PRIMARY KEY (`suaddrId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商地址';

/*Data for the table `supplieraddress` */

/*Table structure for table `takeadvancedetails` */

DROP TABLE IF EXISTS `takeadvancedetails`;

CREATE TABLE `takeadvancedetails` (
  `takid` int(11) NOT NULL COMMENT '详表ID',
  `payid` varchar(20) NOT NULL COMMENT '应付冲款单单号',
  `advdetoddtype` varchar(50) DEFAULT NULL COMMENT '来源预付单单别',
  `advdetoddid` varchar(50) DEFAULT NULL COMMENT '来源预付单号',
  `advancebalance` float DEFAULT NULL COMMENT '预付余额',
  `adoptadvancemoney` float DEFAULT NULL COMMENT '取用预付金额',
  `stodeptid` varchar(50) DEFAULT NULL COMMENT '部门编号',
  `departmentname` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `summaryofsources` varchar(100) DEFAULT NULL COMMENT '来源摘要',
  `enables` int(11) DEFAULT NULL COMMENT '标识是否删除',
  PRIMARY KEY (`takid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='取用预付明细表';

/*Data for the table `takeadvancedetails` */

/*Table structure for table `takeadvancegatherdetails` */

DROP TABLE IF EXISTS `takeadvancegatherdetails`;

CREATE TABLE `takeadvancegatherdetails` (
  `Takid` varchar(20) NOT NULL COMMENT '详表ID',
  `Payid` varchar(20) NOT NULL COMMENT '应付冲款单单号',
  `Advid` varchar(20) NOT NULL COMMENT '预收单单号',
  `Advdetid` varchar(20) NOT NULL COMMENT '预收单行号',
  `Takadvmoney` float NOT NULL COMMENT '取用预收金额',
  `Enables` int(11) NOT NULL COMMENT '标识是否删除',
  `Safetyone` varchar(50) NOT NULL COMMENT '保留字段1',
  `Safetytwo` varchar(50) NOT NULL COMMENT '保留字段2',
  `Extend0` varchar(200) DEFAULT NULL COMMENT '扩展字段0',
  `Extend1` varchar(200) DEFAULT NULL COMMENT '扩展字段1',
  `Extend2` varchar(200) DEFAULT NULL COMMENT '扩展字段2',
  `Extend3` varchar(200) DEFAULT NULL COMMENT '扩展字段3',
  `Extend4` varchar(200) DEFAULT NULL COMMENT '扩展字段4',
  PRIMARY KEY (`Takid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='取用预付明细表';

/*Data for the table `takeadvancegatherdetails` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
