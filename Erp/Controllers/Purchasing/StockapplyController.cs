using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using Currency.FsLayUiModel;
using Erp.Models.Production;
using IBLL;
using IBLL.Purchasing;
using MysqlModel;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace Erp.Controllers.Purchasing
{
    [RoutePrefix("api/Stockapply")]
    /// <summary>
    /// 采购请购单
    /// </summary>
    public class StockapplyController : BaseApiController<stockapply>
    {
        private readonly IStockapplyService _StockapplyService = null;


        public StockapplyController(IStockapplyService stockapplyService)
        {
            base._BaseService = stockapplyService;
            this._StockapplyService = stockapplyService;
        }

        [HttpGet]
        [HttpPost]
        public bool Add()
        {
            try
            {
                stockapply s = new stockapply()
                {
                    Appdate = DateTime.Now,
                    Appcircs = 3,
                    Appdept = "傻逼部门",
                    Appdeptid = "A001",
                    Appid = "001",
                    Appauditing = "无效",
                    Appauditingperson = "复核人员",
                    Appmaker = "制单人员",
                    Appperson = "请购人员",
                    Apppersonid = "",
                    Apptype = "",
                    Enables = 1,
                    Safetyone = "",
                    Safetytwo = "",
                    Stockapplyname = ""
                };


                bool d = _StockapplyService.Add(s);
                return d;

            }
            catch (Exception ex)
            {

                throw ex;
            }


        }


        [HttpGet]
        [HttpPost]
        public List<stockapply> ListStockapply()
        {
            return _StockapplyService.ListModels(s => true).ToList();
        }


        [HttpGet]
        [HttpPost]
        /// <summary>
        /// 新增采购请购单
        /// </summary>
        /// <returns></returns>
        public Result<stockapply> AddStockapply(JObject jObject)
        {
            // fsTableData Table表格数据
            //fsFormData 表单数据
            dynamic obj = jObject;
            string tableObj = obj.fsTableData;
            string fromObj = obj.fsFormData;

            string tableObjJsonStr = Uri.UnescapeDataString(tableObj);
            string fromObjJsonStr = Uri.UnescapeDataString(fromObj);

            dynamic eneitya = JsonConvert.DeserializeObject<dynamic>(fromObjJsonStr);

            //采购请购单
            var eneity = JsonConvert.DeserializeObject<Api_View_Stockapply>(fromObjJsonStr).ToEntity();
            //请购单详细
            var eneitydetails = JsonConvert.DeserializeObject<List<Api_View_StockapplyDetails>>(tableObjJsonStr).ToEntity();

            var test = JsonConvert.DeserializeObject<List<Api_View_StockapplyDetails>>(tableObjJsonStr).MapToList<stockapplydetails>();

            return _StockapplyService.Add(eneity, eneitydetails);
        }


        /// <summary>
        /// 修改采购请购单
        /// </summary>
        /// <returns></returns>
        public Result<stockapply> UpdStockapply(JObject jObject)
        {
            // fsTableData Table表格数据
            //fsFormData 表单数据
            dynamic obj = jObject;
            string tableObj = obj.fsTableData;
            string fromObj = obj.fsFormData;

            string tableObjJsonStr = Uri.UnescapeDataString(tableObj);
            string fromObjJsonStr = Uri.UnescapeDataString(fromObj);

            dynamic eneitya = JsonConvert.DeserializeObject<dynamic>(fromObjJsonStr);

            //采购请购单
            var eneity = JsonConvert.DeserializeObject<Api_View_Stockapply>(fromObjJsonStr).ToEntity();
            //请购单详细
            var eneitydetails = JsonConvert.DeserializeObject<List<Api_View_StockapplyDetails>>(tableObjJsonStr).ToEntity();


            return _StockapplyService.Update(eneity, eneitydetails);
        }

        [HttpPost]
        [HttpGet]
        /// <summary>
        /// 获取分页数据
        /// </summary>
        /// <returns></returns>
        public  Result<stockapply> PageQueny([FromUri]Api_View_Stockapply_Where where, int pageNum, int pageSize)
        {
            string toExamineStatic = where.ToExamineStatic == 1 ? "已复核" : "未复核";
            //条件
            Expression<Func<stockapply, bool>> func = (s) =>
                 (string.IsNullOrEmpty(where.Appid) || s.Appid.StartsWith(where.Appid)) && (!where.Appdate.HasValue || s.Appdate > where.Appdate.Value) && (where.Appcircs==0 || s.Appcircs== where.Appcircs) && (where.ToExamineStatic==0 || s.Appauditing.Equals(toExamineStatic));
            ;

            //分页集合
            var list = _StockapplyService.ListModelsByPage(pageSize, pageNum, false, s => s.Appid,  func, out int total).ToList();

            int pages = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;


            return new Result<stockapply>()
            {
                 errorNo=0, results=new PageFsData<stockapply>(pageNum, pageSize, pages,total,list)
            };
        }

        /// <summary>
        /// 审核
        /// </summary>
        public Result<stockapply> ToExamine()
        {
            //采购请购ID
            string appdid = HttpContext.Current.Request.Form[0];
            //复核状态
            string Appauditing = HttpContext.Current.Request.Form[1];

           return _StockapplyService.ToExamine(appdid, Appauditing);

        }


    }
}
