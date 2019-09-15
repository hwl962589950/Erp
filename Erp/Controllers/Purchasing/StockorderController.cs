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
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace Erp.Controllers.Purchasing
{
    /// <summary>
    /// 采购订单
    /// </summary>
    public class StockorderController : BaseApiController<stockorder>
    {

        private readonly IStockorderService _StockorderService = null;


        public StockorderController(IStockorderService stockorderService)
        {
            base._BaseService = stockorderService;
            this._StockorderService = stockorderService;
        }

        /// <summary>
        /// 新增 采购订单
        /// </summary>
        /// <returns></returns>
        public Result<stockorder> AddStockorder(JObject jObject)
        {
            // fsTableData Table表格数据
            //fsFormData 表单数据
            dynamic obj = jObject;
            string tableObj = obj.fsTableData;
            string fromObj = obj.fsFormData;

            string tableObjJsonStr = Uri.UnescapeDataString(tableObj);
            string fromObjJsonStr = Uri.UnescapeDataString(fromObj);

            //dto模型
            var view_eneit = JsonConvert.DeserializeObject<Api_View_Stockorder>(fromObjJsonStr);
            //采购订单
            var eneit = view_eneit.MapTo<stockorder>();
            //采购订单详细
            var details = JsonConvert.DeserializeObject<List<Api_View_stockorderdetails>>(tableObjJsonStr).MapTo<List<stockorderdetails>>();
            return this._StockorderService.Add(eneit, details, view_eneit.ChangeOrderType);
        }



    }
}
