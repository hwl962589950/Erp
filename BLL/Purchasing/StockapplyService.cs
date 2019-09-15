using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IBLL.Purchasing;
using IDAL.Purchasing;
using IBLL;
using MysqlModel;
using Currency.FsLayUiModel;
using DAL.Purchasing;

namespace BLL.Purchasing
{
    /// <summary>
    /// 采购请购单
    /// </summary>
    public partial class StockapplyService : BaseService<stockapply>, IStockapplyService
    {
        private readonly IStockapplyDAL _StockapplyDAL = null;
        private readonly IStockorderdetailsDAL _StockorderdetailsDAL = null;

        public StockapplyService(IStockapplyDAL stockapply, IStockorderdetailsDAL stockorderdetailsDAL)
        {
            base.DAL = stockapply;
            this._StockapplyDAL = stockapply;
            this._StockorderdetailsDAL = stockorderdetailsDAL;
        }

        public Result<stockapply> Add(stockapply sto, List<stockapplydetails> stockapplydetails)
        {
            //模拟数据
            sto.Appcircs = 3;
            sto.Appdept = "";
            sto.Appperson = "";
            sto.Enables = 0;
            sto.Appdeptid = "";
            sto.Apppersonid = "1";
            sto.Appauditing = "未复核";
            sto.Appauditingperson = "1";
            sto.Appmaker = "1";
            sto.Stockapplyname = "";
            sto.Safetyone = "";
            sto.Safetytwo = "";


            Result<stockapply> result = null;
            try
            {
                Affair.Whether<int, stockapply>(sto, (s) =>
                  {
                      int i = 1;

                      //修改采后编号
                      stockapplydetails.ForEach(d => {

                          d.Safetyone = "";
                          d.Safetytwo = "";
                          d.Appid = sto.Appid;
                          d.TockapplyDetails = sto.Appid + i.ToString("00");
                          i++;
                          });

                      _StockapplyDAL.Add(sto, stockapplydetails);
                      int count = _StockapplyDAL.SaveChanges();
                      int DbCount = 1 + stockapplydetails.Count;
                      if (count != DbCount)
                          throw new Exception("请购单 和 请购详细新增条数不正确");

                      return count;
                  });

                result = new Result<stockapply>()
                {
                    errorInfo = "新增采购成功",
                    errorNo = 0,
                    results = new ModelData<stockapply>()
                    {
                        data = sto
                    }
                };
            }
            catch (Exception ex)
            {
                result = new Result<stockapply>()
                {
                    errorInfo = ex.Message,
                    errorNo = -5,
                    results = null
                };

            }


            return result;
        }

        public Result<stockapply> Update(stockapply sto, List<stockapplydetails> stockapplydetails)
        {
            Result<stockapply> result = null;
            try
            {
                var entity = this._StockapplyDAL.GetModel(s => s.Appid == sto.Appid);
                if (entity == null)
                    throw new Exception($"{sto.Appid} 单号不存在");
                if (!string.IsNullOrEmpty(entity.Extend0))
                    throw new Exception("请购单状态不可以更改");

                entity.Apptype = sto.Apptype;
                entity.Appcircs = sto.Appcircs;


                Affair.Whether<int, stockapply>(sto, (s) =>
                {
                    int i = 1;

                    //修改采后编号
                    stockapplydetails.ForEach(d => {
                        d.Safetyone = "测试修改";
                        d.Safetytwo = "测试修改";
                        d.Appid = sto.Appid;
                        d.TockapplyDetails = sto.Appid + i.ToString("00");
                        i++;
                    });

                    _StockapplyDAL.Update(entity.Appid, stockapplydetails);
                    int count = _StockapplyDAL.SaveChanges();
                   
                    return count;
                });

                result = new Result<stockapply>()
                {
                    errorInfo = "修改采购请购单成功",
                    errorNo = 0,
                    results = new ModelData<stockapply>()
                    {
                        data = sto
                    }
                };
            }
            catch (Exception ex)
            {
                result = new Result<stockapply>()
                {
                    errorInfo = ex.Message,
                    errorNo = -5,
                    results = null
                };

            }


            return result;

        }


        /// <summary>
        /// 审核复核
        /// </summary>
        /// <param name="appdId">请购单ID</param>
        /// <param name="sta">审核状态</param>
        /// <returns></returns>
        public Result<stockapply> ToExamine(string appdId, string sta)
        {
            var resuly = new Result<stockapply>()
            {
                errorNo = 0
            };

            var entity = _StockapplyDAL.GetModel(s => s.Appid == appdId);
            if(entity == null)
            {
                resuly.errorNo = -1;
                resuly.errorInfo = $"请购单 {appdId} 不存在";
            }

            if(entity.Appauditing == "已复核")
            {
                //取消审核
                var count = _StockorderdetailsDAL.ListModels(s => s.Sodorigintype == "采购请购单" && s.Sodorigin == entity.Appid).Count();
                if (count > 0)
                {
                    resuly.errorNo = -1;
                    resuly.errorInfo = $"请购单 {appdId} 已经被其他单据使用不可以取消审核";
                }
                entity.Appauditing = "未复核";
                resuly.errorInfo = "成功取消审核";
            }
            else
            {
                //审核
                entity.Appauditing = "已复核";
                resuly.errorInfo = "成功审核";
            }
            if (DAL.SaveChanges()<=0)
            {
                resuly.errorNo = -1;
                resuly.errorInfo = "数据修改失败！ 请联系管理员";
            }

            return resuly;



        }


    }
}
