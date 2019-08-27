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
    
    public partial class stockstoragetable
    {
    
        /// <summary>  
        /// 单号（自动生成）  
        /// </summary>  
        public string Stockstorageno { get; set; } 
    
        /// <summary>  
        /// 单据日期  
        /// </summary>  
        public Nullable<System.DateTime> Storagedate { get; set; } 
    
        /// <summary>  
        /// 供货商ID  
        /// </summary>  
        public string Purveyid { get; set; } 
    
        /// <summary>  
        /// 供货商名称  
        /// </summary>  
        public string Purveyname { get; set; } 
    
        /// <summary>  
        /// 供货商地址  
        /// </summary>  
        public string Purveyaddress { get; set; } 
    
        /// <summary>  
        /// 仓库ID  
        /// </summary>  
        public string Depotid { get; set; } 
    
        /// <summary>  
        /// 仓库名称  
        /// </summary>  
        public string Depotname { get; set; } 
    
        /// <summary>  
        /// 单价是否含税  
        /// </summary>  
        public string Pricerevenue { get; set; } 
    
        /// <summary>  
        /// 采购人员  
        /// </summary>  
        public string Stoperson { get; set; } 
    
        /// <summary>  
        /// 采购人员所属部门名称  
        /// </summary>  
        public string Stodept { get; set; } 
    
        /// <summary>  
        /// 部门ID  
        /// </summary>  
        public string Stodeptid { get; set; } 
    
        /// <summary>  
        /// 审核人员ID  
        /// </summary>  
        public string Audituserid { get; set; } 
    
        /// <summary>  
        /// 复核人员ID  
        /// </summary>  
        public string Repeatuserid { get; set; } 
    
        /// <summary>  
        /// 备注  
        /// </summary>  
        public string Remark { get; set; } 
    
        /// <summary>  
        /// 单据状态（是否以审核）  
        /// </summary>  
        public Nullable<int> Estate { get; set; } 
    
        /// <summary>  
        /// 保存（“采购入库单”）  
        /// </summary>  
        public string Stockstoragetablename { get; set; } 
    
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
        /// 扩展字段0  
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