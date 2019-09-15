using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Erp.Models.Production
{
    /// <summary>
    /// 采购请购单 视图模型
    /// </summary>
    public partial class Api_View_Stockapply
    {

        /// <summary>  
        /// 请购单编号  
        /// </summary>  
        public string Appid { get; set; }

        /// <summary>  
        /// 请购单日期  
        /// </summary>  
        public System.DateTime Appdate { get; set; }

        /// <summary>  
        /// 请购采购类型  
        /// </summary>  
        public string Apptype { get; set; }

        /// <summary>  
        /// 单况：已结案/未结案/无效  
        /// </summary>  
        public string Appcircs { get; set; }

        /// <summary>  
        /// 请购人员  
        /// </summary>  
        public string Appperson { get; set; }

        /// <summary>  
        /// 伪外键：请购人员id  
        /// </summary>  
        public string Apppersonid { get; set; }

        /// <summary>  
        /// 请购部门  
        /// </summary>  
        public string Appdept { get; set; }

        /// <summary>  
        /// 伪外键：请购部门id  
        /// </summary>  
        public string Appdeptid { get; set; }

        /// <summary>  
        /// 制单人员  
        /// </summary>  
        public string Appmaker { get; set; }

        /// <summary>  
        /// 复核人员  
        /// </summary>  
        public string Appauditingperson { get; set; }


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


    /// <summary>
    /// 采购请购单 查询条件
    /// </summary>
    public partial class Api_View_Stockapply_Where
    {
        /// <summary>  
        /// 请购单编号  
        /// </summary>  
        public string Appid { get; set; }

        /// <summary>  
        /// 请购单日期  
        /// </summary>  
        public  System.DateTime ? Appdate { get; set; }

        /// <summary>  
        /// 单况：全部/已结案/未结案/无效  
        /// </summary>  
        public int Appcircs { get; set; }

        /// <summary> 
        /// 审核状态：全部/已审核/未审核
        /// </summary>  
        public int ToExamineStatic { get; set; }
    }

}