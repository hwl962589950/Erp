using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Erp.Models.Production
{
    /// <summary>
    /// 采购订单详细
    /// </summary>
    public class Api_View_stockorderdetails
    {
        /// <summary>  
        /// 物料编号  
        /// </summary>  
        public string Sodmaterielid { get; set; }

        /// <summary>  
        /// (物料名称)  
        /// </summary>  
        public string Sodmatid { get; set; }

        /// <summary>  
        /// (规格型号)  
        /// </summary>  
        public string Sodspec { get; set; }

        /// <summary>  
        /// 数量  
        /// </summary>  
        public int Sodamount { get; set; }

        /// <summary>  
        /// 折扣前单价  
        /// </summary>  
        public float Sodpreprice { get; set; }

        /// <summary>  
        /// 折数（%）  
        /// </summary>  
        public int Sodagio { get; set; }

        /// <summary>  
        /// 单价  
        /// </summary>  
        public float Sodprice { get; set; }

        /// <summary>  
        /// 金额  
        /// </summary>  
        public float Sodsum { get; set; }

        /// <summary>  
        /// 税率（%）  
        /// </summary>  
        public int Sodcess { get; set; }

        /// <summary>  
        /// (税额)  
        /// </summary>  
        public float Sodsumcess { get; set; }

        /// <summary>  
        /// (含税金额）  
        /// </summary>  
        public float Sodsumprice { get; set; }

        /// <summary>  
        /// 预入库日  
        /// </summary>  
        public System.DateTime Sodpreincomestorage { get; set; }

        /// <summary>
        /// 未入库数量
        /// </summary>
        public int NoRuku { get; set; }

        /// <summary>  
        /// 是否赠品  
        /// </summary>  
        public string Sodpresent { get; set; }

        /// <summary>  
        /// (来源单别)  
        /// </summary>  
        public string Sodorigintype { get; set; }

        /// <summary>  
        /// (来源单号)  
        /// </summary>  
        public string Sodorigin { get; set; }


        /// <summary>  
        /// 转单ID  
        /// </summary>  
        public string Extend0 { get; set; }

        /// <summary>
        /// 分录备注
        /// </summary>
        public string remark { get; set; }

    }
}