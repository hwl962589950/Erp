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

namespace BLL.Purchasing
{
    public partial class StockapplyService : BaseService<stockapply>, IStockapplyService
    {
        private readonly IStockapplyDAL _StockapplyDAL = null;

        public StockapplyService(IStockapplyDAL stockapply)
        {
            base.DAL = stockapply;
            this._StockapplyDAL = stockapply;
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
            sto.Appauditing = "1";
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

                    _StockapplyDAL.Update(sto, stockapplydetails);
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
    }
}
