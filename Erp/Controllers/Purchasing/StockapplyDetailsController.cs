using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Currency.FsLayUiModel;
using IBLL.Purchasing;
using MysqlModel;

namespace Erp.Controllers.Purchasing
{
    /// <summary>
    /// 采购请购详细
    /// </summary>
    public class StockapplyDetailsController : BaseApiController<stockapplydetails>
    {
        private readonly IStockapplyDetailsService _StockapplyDetailsService = null;

        public StockapplyDetailsController(IStockapplyDetailsService stockapplyDetailsService)
        {
            this._StockapplyDetailsService = stockapplyDetailsService;
            base._BaseService = stockapplyDetailsService;
        }

        public IStockapplyDetailsService StockapplyDetailsService { get; set; }

        [HttpGet]
        [HttpPost]
        public int i()
        {
            var a = new stockapplydetails()
            {
                Apddemanddate = DateTime.Now,
                Apdintomoney = 999,
                Apdmateridlid = "A01",
                Apdmateridlname = "物料mingz",
                Apdmodel = "",
                Apdnotnum = 10,
                Apdnum = 10,
                Apdoriginid = "",
                Apdorigintype = "",
                Apdprice = 999,
                Apdremark = "备注",
                Apdstandardmoney = 999,
                Apdstandardprice = 999,
                Apdstockdate = DateTime.Now,
                Apdunit = "个",
                Appid = "A01",
                Enables = 1,
                TockapplyDetails = "001"
            };
            _StockapplyDetailsService.Add(a);
            return 0;
        }


        [HttpGet]
        [HttpPost]
        /// <summary>
        /// 通过采购订单 查询采购详细
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Result<stockapplydetails> StockapplyQueny(string Appid)
            {

            //模拟数据
            var list = new List<stockapplydetails>();

            list.Add(new stockapplydetails()
            {
                Apddemanddate = DateTime.Now,
                Apdintomoney = 999,
                Apdmateridlid = "A01",
                Apdmateridlname = "物料mingz",
                Apdmodel = "",
                Apdnotnum = 10,
                Apdnum = 10,
                Apdoriginid = "",
                Apdorigintype = "",
                Apdprice = 999,
                Apdremark = "备注",
                Apdstandardmoney = 999,
                Apdstandardprice = 999,
                Apdstockdate = DateTime.Now,
                Apdunit = "个",
                Appid = "A01",
                Enables = 1

            });
            list.Add(new stockapplydetails()
            {
                Apddemanddate = DateTime.Now,
                Apdintomoney = 999,
                Apdmateridlid = "A01",
                Apdmateridlname = "物料mingz",
                Apdmodel = "",
                Apdnotnum = 10,
                Apdnum = 10,
                Apdoriginid = "",
                Apdorigintype = "",
                Apdprice = 999,
                Apdremark = "备注",
                Apdstandardmoney = 999,
                Apdstandardprice = 999,
                Apdstockdate = DateTime.Now,
                Apdunit = "个",
                Appid = "A01",
                Enables = 1

            });


            return  new Result<stockapplydetails>()
            {
                errorInfo = "",
                errorNo = 0,
                results = new FsData<stockapplydetails>()
                {
                    data = list
                }
            };
        }


    }
}
