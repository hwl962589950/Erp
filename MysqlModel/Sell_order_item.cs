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
    
    public partial class sell_order_item
    {
    
        /// <summary>  
        /// 自增列  
        /// </summary>  
        public int id { get; set; } 
    
        /// <summary>  
        /// 主单据号  
        /// </summary>  
        public string bill_id { get; set; } 
    
        /// <summary>  
        /// 物料编号  
        /// </summary>  
        public Nullable<int> mat_id { get; set; } 
    
        /// <summary>  
        /// 物料名称  
        /// </summary>  
        public string mat_name { get; set; } 
    
        /// <summary>  
        /// 规格型号  
        /// </summary>  
        public string mat_spec { get; set; } 
    
        /// <summary>  
        /// 单位名称  
        /// </summary>  
        public string mat_unit { get; set; } 
    
        /// <summary>  
        /// 数量  
        /// </summary>  
        public Nullable<int> number { get; set; } 
    
        /// <summary>  
        /// 折扣前单价  
        /// </summary>  
        public Nullable<float> agio_ago_price { get; set; } 
    
        /// <summary>  
        /// 折数（默认100）  
        /// </summary>  
        public Nullable<int> agio { get; set; } 
    
        /// <summary>  
        /// 单价  
        /// </summary>  
        public Nullable<float> price { get; set; } 
    
        /// <summary>  
        /// 金额  
        /// </summary>  
        public Nullable<float> money { get; set; } 
    
        /// <summary>  
        /// 税率（默认17）  
        /// </summary>  
        public Nullable<int> cess { get; set; } 
    
        /// <summary>  
        /// 税额  
        /// </summary>  
        public Nullable<float> taxmoney { get; set; } 
    
        /// <summary>  
        /// 含税金额  
        /// </summary>  
        public Nullable<float> intaxmoney { get; set; } 
    
        /// <summary>  
        /// 是否赠品  
        /// </summary>  
        public Nullable<bool> present { get; set; } 
    
        /// <summary>  
        /// 实际成本  
        /// </summary>  
        public Nullable<float> fact_cost { get; set; } 
    
        /// <summary>  
        /// 标准成本  
        /// </summary>  
        public Nullable<float> criterion_cost { get; set; } 
    
        /// <summary>  
        /// 预出库日  
        /// </summary>  
        public Nullable<System.DateTime> out_tiem { get; set; } 
    
        /// <summary>  
        /// 未出库数量  
        /// </summary>  
        public Nullable<int> no_out_number { get; set; } 
    
        /// <summary>  
        /// 物料组合  
        /// </summary>  
        public Nullable<bool> mat_group { get; set; } 
    
        /// <summary>  
        /// 来源单别  
        /// </summary>  
        public string sin_name { get; set; } 
    
        /// <summary>  
        /// 来源单号  
        /// </summary>  
        public string origin_bill_id { get; set; } 
    
        /// <summary>  
        /// 生产  
        /// </summary>  
        public Nullable<bool> production { get; set; } 
    
        /// <summary>  
        /// 以生产数量  
        /// </summary>  
        public Nullable<int> production_number { get; set; } 
    
        /// <summary>  
        /// 备注  
        /// </summary>  
        public string remark { get; set; } 
    
        /// <summary>  
        /// 是否已被删除  
        /// </summary>  
        public Nullable<bool> is_exit { get; set; } 
    }
}
