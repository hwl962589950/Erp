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
    
    public partial class stagnation
    {
    
        /// <summary>  
        /// 主键ID  
        /// </summary>  
        public int Sid { get; set; } 
    
        /// <summary>  
        /// 物料编号  
        /// </summary>  
        public string Sbh { get; set; } 
    
        /// <summary>  
        /// 物料的名称  
        /// </summary>  
        public string sname { get; set; } 
    
        /// <summary>  
        /// 规格型号  
        /// </summary>  
        public string sxinghao { get; set; } 
    
        /// <summary>  
        /// 类别名称  
        /// </summary>  
        public string sleibiename { get; set; } 
    
        /// <summary>  
        /// 单位名称  
        /// </summary>  
        public string sdanweiname { get; set; } 
    
        /// <summary>  
        /// 最近入库时间  
        /// </summary>  
        public Nullable<System.DateTime> sdata { get; set; } 
    
        /// <summary>  
        /// 备用1  
        /// </summary>  
        public string son { get; set; } 
    
        /// <summary>  
        /// 备用2  
        /// </summary>  
        public string stwo { get; set; } 
    
        /// <summary>  
        /// 备用2  
        /// </summary>  
        public string sthree { get; set; } 
    }
}