﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Erp.Models.Production
{
    /// <summary>
    /// 采购详细单 视图模型
    /// </summary>
    public partial class Api_View_StockapplyDetails
    {
        /// <summary>  
        /// 物料编号(伪外：物料主文件)  
        /// </summary>  
        public string Apdmateridlid { get; set; }

        /// <summary>  
        /// 物料名称  
        /// </summary>  
        public string Apdmateridlname { get; set; }

        /// <summary>  
        /// 规格型号  
        /// </summary>  
        public string Apdmodel { get; set; }

        /// <summary>  
        /// 单位名称  
        /// </summary>  
        public string Apdunit { get; set; }

        /// <summary>  
        /// 数量  
        /// </summary>  
        public Nullable<int> Apdnum { get; set; }

        /// <summary>  
        /// 标准进价  
        /// </summary>  
        public Nullable<float> Apdstandardprice { get; set; }

        /// <summary>  
        /// 标准进价金额  
        /// </summary>  
        public Nullable<float> Apdstandardmoney { get; set; }

        /// <summary>  
        /// 单价  
        /// </summary>  
        public Nullable<float> Apdprice { get; set; }

        /// <summary>  
        /// 进价金额  
        /// </summary>  
        public Nullable<float> Apdintomoney { get; set; }

        /// <summary>  
        /// 需求日期  
        /// </summary>  
        public Nullable<System.DateTime> Apddemanddate { get; set; }

        /// <summary>  
        /// 建议采购日期  
        /// </summary>  
        public Nullable<System.DateTime> Apdstockdate { get; set; }

        /// <summary>  
        /// 未采购数量  
        /// </summary>  
        public Nullable<int> Apdnotnum { get; set; }

        /// <summary>  
        /// 来源单别  
        /// </summary>  
        public string Apdoriginid { get; set; }

        /// <summary>  
        /// 来源单号  
        /// </summary>  
        public string Apdorigintype { get; set; }

        /// <summary>  
        /// 备注  
        /// </summary>  
        public string Apdremark { get; set; }

     

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