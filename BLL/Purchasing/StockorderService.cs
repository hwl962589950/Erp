using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Currency.FsLayUiModel;
using IBLL.Purchasing;
using IDAL.Purchasing;
using MysqlModel;

namespace BLL.Purchasing
{
    /// <summary>
    /// 采购订单
    /// </summary>
    public partial class StockorderService : BaseService<stockorder>, IStockorderService
    {

        private readonly IStockorderDAL _StockorderDAL = null;
        private readonly IStockapplyDAL _StockapplyDAL = null;
        private readonly IStockapplydetailsDAL _StockapplydetailsDAL = null;
        private readonly IStockorderdetailsDAL _StockorderdetailsDAL = null;


        public StockorderService(IStockorderDAL stockorder, IStockapplyDAL stockapplyDAL, IStockapplydetailsDAL stockapplydetailsDAL, IStockorderdetailsDAL stockorderdetailsDAL)
        {
            base.DAL = stockorder;
            this._StockorderDAL = stockorder;
            this._StockapplyDAL = stockapplyDAL;
            this._StockapplydetailsDAL = stockapplydetailsDAL;
            this._StockorderdetailsDAL = stockorderdetailsDAL;
        }




        /// <summary>
        /// 新增采购请购单
        /// </summary>
        /// <param name="sto">采购订单</param>
        /// <param name="stockorderdetails">采购订单详细</param>
        /// <returns></returns>
        public Result<stockorder> Add(stockorder sto, List<stockorderdetails> stockorderdetails, int changeOrderType)
        {
            var result = new Result<stockorder>()
            {
                 errorNo=0, errorInfo= "新增采购订单成功",  results=new ModelData<stockorder>()
                 {
                      data=sto
                 }

            };
            int id = 1;
            try
            {

                //修改新增固定值
                sto.Checkstate = 2;


                switch (changeOrderType)
                {
                    case 0: //普通新增采购订单
                        Affair.Whether<int, Result<stockorder>>(result, (obj) =>
                        {
                            var stoder = this._StockorderDAL.GetModel(s => s.Stoid == sto.Stoid);
                            if (stoder != null)
                                throw new Exception("单据号码 {sto.Stoid} 已经存在");

                        //新增 采购订单
                        this._StockorderDAL.Add(sto);
                            foreach (var item in stockorderdetails)
                            {
                                item.Sodlineid = sto.Stoid + id++.ToString("00");
                                item.Sodid = sto.Stoid;
                            //新增采购订单详细
                            this._StockorderdetailsDAL.Add(item);
                            }
                            return this.DAL.SaveChanges();



                        });
                        break;
                    case 1: //转单采购请购单的 
                        Affair.Whether<int, Result<stockorder>>(result, (obj) =>
                        {
                            var stoder = this._StockorderDAL.GetModel(s => s.Stoid == sto.Stoid);
                            if (stoder != null)
                                throw new Exception("单据号码 {sto.Stoid} 已经存在");

                        //新增 采购订单
                        this._StockorderDAL.Add(sto);

                            var appid = stockorderdetails[0].Sodorigin;
                            var stockapply = this._StockapplyDAL.GetModel(s => s.Appid.Equals(appid));
                            if (stockapply == null)
                                throw new Exception($"转入的请购单：{appid} 不存在 ");

                        //获取请购详细
                        var stockapplyderdetails = this._StockapplydetailsDAL.ListModels(s => s.Appid == stockapply.Appid).ToList();
                            foreach (var item in stockapplyderdetails)
                            {
                                var orderderdetails = stockorderdetails.FirstOrDefault(s => s.Extend0 == item.TockapplyDetails);
                                if (orderderdetails == null)
                                    throw new Exception($"请购单中：{appid}  请购列表物料 {item.TockapplyDetails} 物料名称{item.Apdmateridlid} 缺少 ");

                            //大于请购单 直接未采购数量变成0
                            if (orderderdetails.Sodamount > item.Apdnotnum)
                                {
                                    item.Apdnotnum = 0;
                                }
                                else
                                {
                                //修改未采购数量
                                item.Apdnotnum = item.Apdnotnum - orderderdetails.Sodamount;
                                }

                                orderderdetails.Sodlineid = sto.Stoid + id++.ToString("00");
                                orderderdetails.Sodid = sto.Stoid;
                                //新增采购订单详细
                                this._StockorderdetailsDAL.Add(orderderdetails);
                            }

                        //判断是否全部采购完成
                        var count = stockapplyderdetails.Count(s => s.Apdnotnum <= 0);
                            if (count == stockapplyderdetails.Count )
                            {
                            //修改采购请购单
                            stockapply.Appcircs = 1;
                                stockapply.Extend0 = "不可修改";
                            }
                            return this._StockapplyDAL.SaveChanges();
                        });
                        break;
                }
                return result;


            }
            catch (Exception ex)
                {
                return new Result<stockorder>()
                {
                    errorNo = -788,
                     errorInfo=ex.Message,
                    results = null
                };
            }
        }
    }
}
