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
    
    public partial class accountmoneydetail
    {
    
        /// <summary>  
        /// 主键ID  
        /// </summary>  
        public int storageid { get; set; } 
    
        /// <summary>  
        /// 单据日期  
        /// </summary>  
        public Nullable<System.DateTime> storagedate { get; set; } 
    
        /// <summary>  
        /// 来源单别  
        /// </summary>  
        public string origintypes { get; set; } 
    
        /// <summary>  
        /// 来源单号  
        /// </summary>  
        public string originid { get; set; } 
    
        /// <summary>  
        /// 日期  
        /// </summary>  
        public Nullable<System.DateTime> nowdate { get; set; } 
    
        /// <summary>  
        /// 供货商名称  
        /// </summary>  
        public string clientsupply { get; set; } 
    
        /// <summary>  
        /// 供货商ID  
        /// </summary>  
        public string citationid { get; set; } 
    
        /// <summary>  
        /// 原单金额  
        /// </summary>  
        public Nullable<float> formerlymoneys { get; set; } 
    
        /// <summary>  
        /// 现行余额  
        /// </summary>  
        public Nullable<float> nowadaysmoneys { get; set; } 
    
        /// <summary>  
        /// 标识是否删除  
        /// </summary>  
        public Nullable<int> enables { get; set; } 
    }
}