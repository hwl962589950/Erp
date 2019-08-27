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
    
    public partial class takeadvancedetails
    {
    
        /// <summary>  
        /// 应付冲款单单号  
        /// </summary>  
        public string payid { get; set; } 
    
        /// <summary>  
        /// 行号  
        /// </summary>  
        public Nullable<int> takid { get; set; } 
    
        /// <summary>  
        /// 来源预付单单别  
        /// </summary>  
        public string advdetoddtype { get; set; } 
    
        /// <summary>  
        /// 来源预付单号  
        /// </summary>  
        public string advdetoddid { get; set; } 
    
        /// <summary>  
        /// 预付余额  
        /// </summary>  
        public Nullable<float> advancebalance { get; set; } 
    
        /// <summary>  
        /// 取用预付金额  
        /// </summary>  
        public Nullable<float> adoptadvancemoney { get; set; } 
    
        /// <summary>  
        /// 部门编号  
        /// </summary>  
        public string stodeptid { get; set; } 
    
        /// <summary>  
        /// 部门名称  
        /// </summary>  
        public string departmentname { get; set; } 
    
        /// <summary>  
        /// 来源摘要  
        /// </summary>  
        public string summaryofsources { get; set; } 
    
        /// <summary>  
        /// 标识是否删除  
        /// </summary>  
        public Nullable<int> enables { get; set; } 
    }
}
