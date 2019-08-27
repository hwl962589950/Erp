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
    
    public partial class clashfunddetailsone
    {
    
        /// <summary>  
        /// 单据号码clashfund(billId)  
        /// </summary>  
        public string Billid { get; set; } 
    
        /// <summary>  
        /// 栏号  
        /// </summary>  
        public int Cotemark { get; set; } 
    
        /// <summary>  
        /// 来源单别(销售订单)  
        /// </summary>  
        public string Sinname { get; set; } 
    
        /// <summary>  
        /// 来源单号  
        /// </summary>  
        public string Originbillid { get; set; } 
    
        /// <summary>  
        /// 原单日期  
        /// </summary>  
        public System.DateTime Originodddate { get; set; } 
    
        /// <summary>  
        /// 原单金额  
        /// </summary>  
        public float Originoddmoney { get; set; } 
    
        /// <summary>  
        /// 现行余额  
        /// </summary>  
        public float Currentlybalance { get; set; } 
    
        /// <summary>  
        /// 折让金额  
        /// </summary>  
        public float Discountmoney { get; set; } 
    
        /// <summary>  
        /// 冲款金额  
        /// </summary>  
        public float Clashmoney { get; set; } 
    
        /// <summary>  
        /// 标识是否删除  
        /// </summary>  
        public int Enables { get; set; } 
    
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