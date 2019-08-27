//------------------------------------------------------------------------------
// <auto-generated>
//    此代码是根据模板生成的。
//
//    手动更改此文件可能会导致应用程序中发生异常行为。
//    如果重新生成代码，则将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace MysqlModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class stockrecede
    {
    
        /// <summary>  
        /// 采购退货单号  
        /// </summary>  
        public string Recid { get; set; } 
    
        /// <summary>  
        /// 单据日期  
        /// </summary>  
        public Nullable<System.DateTime> Recdate { get; set; } 
    
        /// <summary>  
        /// 供应商编号  
        /// </summary>  
        public string Peoid { get; set; } 
    
        /// <summary>  
        /// 供货商名称  
        /// </summary>  
        public string Purveyname { get; set; } 
    
        /// <summary>  
        /// 供应商地址  
        /// </summary>  
        public string Peoaddress { get; set; } 
    
        /// <summary>  
        /// 仓库编号  
        /// </summary>  
        public string Stoid { get; set; } 
    
        /// <summary>  
        /// 仓库名称  
        /// </summary>  
        public string Depotname { get; set; } 
    
        /// <summary>  
        /// 单价是否含税  
        /// </summary>  
        public Nullable<int> Containtax { get; set; } 
    
        /// <summary>  
        /// 是否重新入库  
        /// </summary>  
        public Nullable<int> Anewstorage { get; set; } 
    
        /// <summary>  
        /// 采购人员姓名  
        /// </summary>  
        public string Stoperson { get; set; } 
    
        /// <summary>  
        /// 采购人员ID  
        /// </summary>  
        public string Stopersonid { get; set; } 
    
        /// <summary>  
        /// 请购部门  
        /// </summary>  
        public string Stodept { get; set; } 
    
        /// <summary>  
        /// 部门编号  
        /// </summary>  
        public string Stodeptid { get; set; } 
    
        /// <summary>  
        /// 制单人员  
        /// </summary>  
        public string Makeperson { get; set; } 
    
        /// <summary>  
        /// 复核人员  
        /// </summary>  
        public string Auditingperson { get; set; } 
    
        /// <summary>  
        /// 备注  
        /// </summary>  
        public string Recremark { get; set; } 
    
        /// <summary>  
        /// 单据状态( 是否已经审核)  
        /// </summary>  
        public string Estate { get; set; } 
    
        /// <summary>  
        /// 保存（“采购退货单”）  
        /// </summary>  
        public string Stockrecedename { get; set; } 
    
        /// <summary>  
        /// 标识是否删除  
        /// </summary>  
        public Nullable<int> Enables { get; set; } 
    
        /// <summary>  
        /// 保留字段  
        /// </summary>  
        public string Safetyone { get; set; } 
    
        /// <summary>  
        /// 保留字段  
        /// </summary>  
        public string Safetytwo { get; set; } 
    
        /// <summary>  
        /// 扩?棺侄?  
        /// </summary>  
        public string Extend0 { get; set; } 
    
        /// <summary>  
        /// 扩展字段1  
        /// </summary>  
        public string Extend1 { get; set; } 
    
        /// <summary>  
        /// 扩展字段2  
        /// </summary>  
        public string Extend2 { get; set; } 
    
        /// <summary>  
        /// 扩展字段3  
        /// </summary>  
        public string Extend3 { get; set; } 
    
        /// <summary>  
        /// 扩展字段4  
        /// </summary>  
        public string Extend4 { get; set; } 
    }
}