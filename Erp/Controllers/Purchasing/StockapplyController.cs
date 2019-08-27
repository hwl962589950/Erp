using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using IBLL;
using IBLL.Production;
using MysqlModel;

namespace Erp.Controllers.Purchasing
{
    /// <summary>
    /// 采购请购单
    /// </summary>
    public class StockapplyController : ApiController
    {
        private readonly IStockapplyService _StockapplyService = null;
        public StockapplyController(IStockapplyService stockapplyService)
        {
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

                throw;
            }


        }


        [HttpGet]
        [HttpPost]
        public List<stockapply> ListStockapply()
        {
            return _StockapplyService.ListModels(s => true).ToList();
        }





    }
}
