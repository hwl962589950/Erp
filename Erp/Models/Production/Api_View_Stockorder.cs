using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Erp.Models.Production
{
    /// <summary>
    /// 采购订单
    /// </summary>
    public class Api_View_Stockorder
    {

        /// <summary>
        /// 转单类型 0转单 1采购请购单转入
        /// </summary>
        public int ChangeOrderType { get; set; }


        /// <summary>  
        /// 单据号  
        /// </summary>  
        public string Stoid { get; set; }

        /// <summary>  
        /// 日期  
        /// </summary>  
        public System.DateTime Stodate { get; set; }

        /// <summary>  
        /// 供货商  
        /// </summary>  
        public string Stopeoname { get; set; }

        /// <summary>  
        /// 供货商编号  
        /// </summary>  
        public string Stopeoid { get; set; }




        /// <summary>  
        /// 供货商地址  
        /// </summary>  
        public string Stopeoadress { get; set; }

        /// <summary>  
        /// 单价是否含税：1-含税，2-未税  
        /// </summary>  
        public string Stoistax { get; set; }

        /// <summary>  
        /// 单况：1-未结案，2-已结案，3-无效  
        /// </summary>  
        public int Stostate { get; set; }

        /// <summary>  
        /// 送货地址  
        /// </summary>  
        public string Stoadress { get; set; }

        /// <summary>  
        /// 采购人员  
        /// </summary>  
        public string Stoempstock { get; set; }

        /// <summary>  
        /// 伪外键:采购人员id  
        /// </summary>  
        public string Stopersonid { get; set; }

        /// <summary>  
        /// 采购部门  
        /// </summary>  
        public string Stodept { get; set; }

        /// <summary>  
        /// 伪外键:部门id  
        /// </summary>  
        public string Stodeptid { get; set; }

        /// <summary>  
        /// 制单人员  
        /// </summary>  
        public string Stoempname { get; set; }

        /// <summary>  
        /// 复核人员  
        /// </summary>  
        public string Stoempcheck { get; set; }

        /// <summary>  
        /// 备注  
        /// </summary>  
        public string Stomark { get; set; }

    }
}