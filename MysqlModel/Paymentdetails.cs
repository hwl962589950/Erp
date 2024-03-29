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
    
    public partial class paymentdetails
    {
    
        /// <summary>  
        /// 详表ID  
        /// </summary>  
        public string paydetid { get; set; } 
    
        /// <summary>  
        /// 应付冲款单单号  
        /// </summary>  
        public string payid { get; set; } 
    
        /// <summary>  
        /// 来源单别  
        /// </summary>  
        public string advdetoddtype { get; set; } 
    
        /// <summary>  
        /// 原单日期  
        /// </summary>  
        public Nullable<System.DateTime> originaldate { get; set; } 
    
        /// <summary>  
        /// 原单单号  
        /// </summary>  
        public string advdetoddid { get; set; } 
    
        /// <summary>  
        /// 发票号码  
        /// </summary>  
        public string invoicenumber { get; set; } 
    
        /// <summary>  
        /// 交易对象  
        /// </summary>  
        public string transactors { get; set; } 
    
        /// <summary>  
        /// 交易对象名称  
        /// </summary>  
        public string Transactorsname { get; set; } 
    
        /// <summary>  
        /// 部门编号  
        /// </summary>  
        public string stodeptid { get; set; } 
    
        /// <summary>  
        /// 部门名称  
        /// </summary>  
        public string departmentname { get; set; } 
    
        /// <summary>  
        /// 采购人员  
        /// </summary>  
        public string Purchaser { get; set; } 
    
        /// <summary>  
        /// 项目名称  
        /// </summary>  
        public string entryname { get; set; } 
    
        /// <summary>  
        /// 原单金额  
        /// </summary>  
        public Nullable<float> formeroddmoney { get; set; } 
    
        /// <summary>  
        /// 现行余额  
        /// </summary>  
        public Nullable<float> nocebalance { get; set; } 
    
        /// <summary>  
        /// 折让金额  
        /// </summary>  
        public Nullable<float> payzr { get; set; } 
    
        /// <summary>  
        /// 冲款金额  
        /// </summary>  
        public Nullable<float> paydetmoney { get; set; } 
    
        /// <summary>  
        /// 冲抵金额  
        /// </summary>  
        public Nullable<float> rushmoney { get; set; } 
    
        /// <summary>  
        /// 标识是否删除  
        /// </summary>  
        public Nullable<int> enables { get; set; } 
    }
}
