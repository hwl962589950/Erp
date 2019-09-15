using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Currency.FsLayUiModel;
using Erp.Models.Production;
using IBLL.Purchasing;
using MysqlModel;

namespace Erp.Controllers.Purchasing
{
    /// <summary>
    /// 采购订单详细
    /// </summary>
    public class StockorderdetailsController : BaseApiController<stockorderdetails>
    {
        private readonly IStockapplyDetailsService _StockapplyDetailsService = null;
        private readonly IStockorderdetailsService _StockorderdetailsService = null;

        public StockorderdetailsController(IStockapplyDetailsService stockapplyDetailsService, IStockorderdetailsService stockorderdetailsService)
        {
            base._BaseService = stockorderdetailsService;
            this._StockorderdetailsService = stockorderdetailsService;
            this._StockapplyDetailsService = stockapplyDetailsService;
        }



        [HttpPost]
        [HttpGet]
        /// <summary>
        /// 通过采购请购单 获取 转单采购订单详细
        /// </summary>
        /// <param name="Appid"></param>
        /// <returns></returns>
        public Result<Api_View_stockorderdetails> ZDStockorder(string Appid)
        {
            //采购请购单的物料
            var list = _StockapplyDetailsService.ListModels(s => s.Appid == Appid).ToList();

            //采购订单转单后物料集合
            var list2 = new List<Api_View_stockorderdetails>();


            list.ForEach(s =>
            {
                var stockorderdetails = new Api_View_stockorderdetails()
                {
                    Sodmaterielid = s.Apdmateridlid,
                    Sodamount = s.Apdnum.Value,
                    Sodmatid = s.Apdmateridlname,
                    Sodorigin = Appid,
                    Sodagio = 100,
                    Sodcess = 17,
                    Sodpreincomestorage = s.Apdstockdate.Value,
                    Sodsumprice = 0,
                    Sodsumcess = 0,
                    Sodspec = s.Apdmodel,
                    Sodprice = s.Apdstandardprice.Value,
                    Sodpresent = "否",
                    Sodpreprice = s.Apdstandardprice.Value,
                    Sodsum = s.Apdstandardprice.Value * s.Apdnum.Value,
                    Sodorigintype = "采购请购单",
                    NoRuku= s.Apdnum.Value,
                    Extend0=s.TockapplyDetails
                };

                list2.Add(stockorderdetails);

            });

            return new Result<Api_View_stockorderdetails>()
            {
                errorInfo = "",
                errorNo = 0,
                results = new FsData<Api_View_stockorderdetails>()
                {
                    data = list2
                }
            };

        }



    }
}
