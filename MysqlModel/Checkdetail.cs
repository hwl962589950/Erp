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
    
    public partial class checkdetail
    {
    
        /// <summary>  
        /// 单据号码  
        /// </summary>  
        public string Dcheid { get; set; } 
    
        /// <summary>  
        /// 栏号  
        /// </summary>  
        public int Dchelineid { get; set; } 
    
        /// <summary>  
        /// 物料的编号  
        /// </summary>  
        public string Dchematerielid { get; set; } 
    
        /// <summary>  
        /// 物料的名称  
        /// </summary>  
        public string DcheunitnameDchematerielname { get; set; } 
    
        /// <summary>  
        /// 单位  
        /// </summary>  
        public string Dcheunitname { get; set; } 
    
        /// <summary>  
        /// 账面数量  
        /// </summary>  
        public Nullable<int> Dcheaccountqty { get; set; } 
    
        /// <summary>  
        /// 盘点数量  
        /// </summary>  
        public Nullable<int> Dchecheckqty { get; set; } 
    
        /// <summary>  
        /// 盈亏数量  
        /// </summary>  
        public Nullable<int> Dcheprofitandlossqty { get; set; } 
    
        /// <summary>  
        /// 盈亏金额  
        /// </summary>  
        public Nullable<int> Dcheprofitandlossmoney { get; set; } 
    
        /// <summary>  
        /// 单价  
        /// </summary>  
        public Nullable<int> Dcheprice { get; set; } 
    
        /// <summary>  
        /// 备注  
        /// </summary>  
        public string Dcheremark { get; set; } 
    
        /// <summary>  
        /// 保留字段  
        /// </summary>  
        public string Done { get; set; } 
    
        /// <summary>  
        /// 保留字段  
        /// </summary>  
        public string Dtwo { get; set; } 
    
        /// <summary>  
        /// 规格型号  
        /// </summary>  
        public string DMovespectype { get; set; } 
    }
}