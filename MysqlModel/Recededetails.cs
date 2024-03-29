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
    
    public partial class recededetails
    {
    
        /// <summary>  
        /// 采购退货单号(stockrecede外键)  
        /// </summary>  
        public string Recid { get; set; } 
    
        /// <summary>  
        /// 物料编号(非外键)  
        /// </summary>  
        public string Matid { get; set; } 
    
        /// <summary>  
        /// 物料名称  
        /// </summary>  
        public string Matname { get; set; } 
    
        /// <summary>  
        /// 规格型号  
        /// </summary>  
        public string Matspec { get; set; } 
    
        /// <summary>  
        /// 数量  
        /// </summary>  
        public Nullable<int> Detnum { get; set; } 
    
        /// <summary>  
        /// 折扣前单价  
        /// </summary>  
        public Nullable<float> Detagioprice { get; set; } 
    
        /// <summary>  
        /// 折数  
        /// </summary>  
        public Nullable<int> Detdiscount { get; set; } 
    
        /// <summary>  
        /// 单价  
        /// </summary>  
        public Nullable<float> Detprice { get; set; } 
    
        /// <summary>  
        /// 金额  
        /// </summary>  
        public Nullable<float> Detamtmoney { get; set; } 
    
        /// <summary>  
        /// 税率  
        /// </summary>  
        public Nullable<int> Depcess { get; set; } 
    
        /// <summary>  
        /// 税额  
        /// </summary>  
        public Nullable<float> Depcessmoney { get; set; } 
    
        /// <summary>  
        /// 是否赠品  
        /// </summary>  
        public Nullable<int> Deplargess { get; set; } 
    
        /// <summary>  
        /// 来源单别  
        /// </summary>  
        public string Sodorigintype { get; set; } 
    
        /// <summary>  
        /// 来源单号  
        /// </summary>  
        public string Sodorigin { get; set; } 
    
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
