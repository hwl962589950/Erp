using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
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
           var eneity=  JsonConvert.DeserializeObject<Api_View_Stockapply>(fromObjJsonStr).ToEntity();
            //请购单详细
           var eneitydetails = JsonConvert.DeserializeObject<List<Api_View_StockapplyDetails>>(tableObjJsonStr).ToEntity();

            var test = JsonConvert.DeserializeObject<List<Api_View_StockapplyDetails>>(tableObjJsonStr).MapToList<stockapplydetails>();

            return _StockapplyService.Add(eneity, eneitydetails);
        }





    }
}
